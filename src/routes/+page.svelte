<script>
    
    import { Sheet, SheetContent, SheetTrigger } from "$lib/components/ui/sheet";
    import Icon from "@iconify/svelte";
    import Integrations from "$lib/components/Integrations.svelte";
    import Styles from "$lib/components/Styles.svelte";
    import Data from "$lib/components/Data.svelte";

    let activeTab = 'integrações';
    const tabs = ['integrações', 'conta', 'aparência', 'contatos', 'dados'];
</script>

<div class="flex sm:flex-col lg:flex-row h-screen max-h-[100vh] overflow-y-hidden bg-[#2e292f] text-[#db55f3]">
    <nav class="hidden lg:block w-64 bg-dark-purple p-4 border-r-2 border-r-[#cc22e0]">
        <h2 class="text-xl font-bold mb-4">Dashboard</h2>
        <ul>
        {#each tabs as tab}
            <li>
            <button 
                class={`w-full text-left p-2 hover:bg-light-purple rounded ${activeTab === tab ? 'bg-light-purple' : ''}`}
                on:click={() => activeTab = tab}
            >
                {tab}
            </button>
            </li>
        {/each}
        </ul>
    </nav>

    <div class="sm:block lg:hidden px-5 py-2 justify-between items-center">
        <Sheet closeOnOutsideClick closeOnEscape>
            <SheetTrigger>
                <Icon icon="bx:menu" class="text-[32px]" />
            </SheetTrigger>
            <SheetContent dir="ltr">
                <nav class="w-64 bg-dark-purple p-4 border-r-2 border-r-[#cc22e0] text-[#db55f3]">
                    <h2 class="text-xl font-bold mb-4">Dashboard</h2>
                    <ul>
                    {#each tabs as tab}
                        <li>
                        <button 
                            class={`w-full text-left p-2 hover:bg-light-purple rounded ${activeTab === tab ? 'bg-light-purple' : ''}`}
                            on:click={() => activeTab = tab}
                        >
                            {tab}
                        </button>
                        </li>
                    {/each}
                    </ul>
                </nav>
            </SheetContent>
        </Sheet>
    </div>

    <main class="flex-1 p-6">
        {#if activeTab === 'integrações'}
        <Integrations/>
        {:else if activeTab === 'conta'}
        <h3 class="text-2xl font-semibold">Conta</h3>
        <p>Conteúdo sobre conta...</p>
        {:else if activeTab === 'aparência'}
        <Styles/>
        {:else if activeTab === 'contatos'}
        <h3 class="text-2xl font-semibold">Contatos</h3>
        <p>Conteúdo sobre contatos...</p>
        {:else if activeTab === 'dados'}
        <Data/>
        {/if}
    </main>
</div>
  