<script lang="ts">
    import Icon from "@iconify/svelte";
    import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "$lib/components/ui/card";

    const integrations = [
        {
            "title": "whatsapp",
            "description": "Faça uma integração com whatsapp facilmente com suporte a QR-Codes para conexão!",
            "icon": "logos:whatsapp-icon"
        },
        {
            "title": "telegram",
            "description": "Faça uma integração com Telegram para conversas mais seguras.",
            "icon": "logos:telegram"
        }
    ];
</script>

<div class="flex flex-col p-4 space-y-10 h-screen overflow-y-scroll">
    <h1 class="text-lg font-semibold">Suas integrações</h1>
    <div class="mx-auto h-full grid grid-flow-row lg:grid-flow-col grid-cols-1 lg:grid-cols-3 gap-x-6 gap-y-4">
        {#each integrations as integration}
            <Card class="integration-card">
                <CardHeader class="flex flex-row justify-start space-x-4 items-center">
                    <Icon icon={integration.icon} class="text-[32px]" />
                    <CardTitle>
                        {integration.title}
                    </CardTitle>
                </CardHeader>
                <CardContent class="flex flex-col h-[85%] max-w-fit">
                    <CardDescription class="text-zinc-100">
                        {integration.description}
                    </CardDescription>
                    <button class="bg-purple-600 hover:bg-purple-500 text-sm font-semibold text-white rounded-xl px-4 py-2 border border-white mt-auto">
                        Acessar
                    </button>
                </CardContent>
            </Card>
        {/each}
    </div>
</div>