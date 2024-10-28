<script lang="ts">
    import { Select, SelectContent, SelectGroup, SelectItem, SelectTrigger } from "$lib/components/ui/select";
    import { type Selected } from "bits-ui";

    const conversationModes = [
        { value: 1, label: "Direto e Objetivo" },
        { value: 2, label: "Amplo" },
        { value: 3, label: "Intelectual" }
    ];

    const agentPersonalities = [
        { value: 1, label: "Simpático" },
        { value: 2, label: "Neutro" },
        { value: 3, label: "Psicopata" }
    ];

    let conversationMode = $state<number>();
    let agentPersonality = $state<number>();

    let triggerConversationMode = $derived(
        conversationModes.find(arg => arg.value === conversationMode)?.label ?? "Select an option"
    );

    let triggerAgentPersonality = $derived(
        agentPersonalities.find(arg => arg.value === agentPersonality)?.label ?? "Select an option"
    );

</script>

<div class="flex flex-col p-4 space-y-10 max-h-[100vh] overflow-y-scroll">
    <div class="flex flex-col space-y-6">
        <h1 class="text-lg font-semibold">Definições de Comportamento</h1>
        <div class="flex flex-col space-y-8 pb-10">
            <div class="grid grid-cols-2 grid-rows-1 w-full px-4 py-2">
                <p class="font-semibold text-white text-sm">Nome da Definição de comportamento</p>
                <input 
                type="text" 
                class="rounded-xl border border-white text-white outline-none text-sm px-2 py-1 bg-zinc-900"
                />
            </div>
            <div class="grid grid-cols-2 grid-rows-1 w-full px-4 py-2">
                <p class="font-semibold text-white text-sm">Nome do Agente</p>
                <input 
                type="text" 
                class="rounded-xl border border-white text-white outline-none text-sm px-2 py-1 bg-zinc-900"
                />
            </div>
            <div class="grid grid-cols-2 grid-rows-1 w-full px-4 py-2">
                <p class="font-semibold text-white text-sm">Modo de comunicação</p>
                <Select onSelectedChange={(val: Selected<number> | undefined) => conversationMode = val?.value}>
                    <SelectTrigger class="rounded-xl border border-white text-white outline-none text-sm px-2 bg-zinc-900">
                        {triggerConversationMode}
                    </SelectTrigger>
                    <SelectContent class="bg-zinc-900 text-[#db55f3]">
                        <SelectGroup>
                            {#each conversationModes as mode }
                                <SelectItem value={mode.value} label={mode.label}>
                                    {mode.label}
                                </SelectItem>
                            {/each}
                        </SelectGroup>
                    </SelectContent>
                </Select>
            </div>
            <div class="grid grid-cols-2 grid-rows-1 w-full px-4 py-2">
                <p class="font-semibold text-white text-sm">Personalidade</p>
                <Select onSelectedChange={(val: Selected<number> | undefined) => agentPersonality = val?.value}>
                    <SelectTrigger class="rounded-xl border border-white text-white outline-none text-sm px-2 bg-zinc-900">
                        {triggerAgentPersonality}
                    </SelectTrigger>
                    <SelectContent class="bg-zinc-900 text-[#db55f3]">
                        <SelectGroup>
                            {#each agentPersonalities as personality}
                                <SelectItem value={personality.value} label={personality.label}>
                                    {personality.label}
                                </SelectItem>
                            {/each}
                        </SelectGroup>
                    </SelectContent>
                </Select>
            </div>
            <div class="grid grid-cols-2 grid-rows-1 w-full px-4 py-2">
                <p class="font-semibold text-white text-sm">Adicione informações do seu negócio</p>
                <textarea
                class="rounded-xl border border-white text-white outline-none text-sm px-2 py-1 bg-zinc-900 w-full h-[300px] overflow-y-scroll"
                ></textarea>
            </div>
        </div>
    </div>
</div>