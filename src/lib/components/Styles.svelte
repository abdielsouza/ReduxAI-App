<script lang="ts">
    import { Select, SelectContent, SelectGroup, SelectItem, SelectTrigger } from "$lib/components/ui/select";
    import { type Selected } from "bits-ui";

    const themes = [
        {value: 1, label: "Padrão Claro"},
        {value: 2, label: "Padrão Escuro"},
        {value: 3, label: "Floresta Negra"},
        {value: 4, label: "Azul Profundo"},
        {value: 5, label: "Azul Celeste"},
        {value: 6, label: "Vermelho Fogo"}
    ];

    const languages = [
        {value: 1, label: "Português"},
        {value: 2, label: "English"},
        {value: 3, label: "Español"}
    ];

    let currentTheme = $state<number | undefined>(2);
    let currentLanguage = $state<number | undefined>(1);

    const triggerCurrentTheme = $derived(
        themes.find(arg => arg.value === currentTheme)?.label
    );

    const triggerCurrentLanguage = $derived(
        languages.find(arg => arg.value === currentLanguage)?.label
    );

</script>

<div class="flex flex-col p-4 space-y-10 max-h-[100vh] overflow-y-scroll">
    <div class="flex flex-col space-y-6">
        <h1 class="text-lg font-semibold">Aparência</h1>
        <div class="flex flex-col space-y-8 pb-10">
            <div class="grid grid-cols-2 grid-rows-1 w-full px-4 py-2">
                <p class="font-semibold text-white text-sm">Tema</p>
                <Select onSelectedChange={(val: Selected<number> | undefined) => currentTheme = val?.value}>
                    <SelectTrigger class="rounded-xl border border-white text-white outline-none text-sm px-2 bg-zinc-900">
                        {triggerCurrentTheme}
                    </SelectTrigger>
                    <SelectContent class="bg-zinc-900 text-[#db55f3]">
                        <SelectGroup>
                            {#each themes as theme }
                                <SelectItem value={theme.value} label={theme.label}>
                                    {theme.label}
                                </SelectItem>
                            {/each}
                        </SelectGroup>
                    </SelectContent>
                </Select>
            </div>
            <div class="grid grid-cols-2 grid-rows-1 w-full px-4 py-2">
                <p class="font-semibold text-white text-sm">Idioma</p>
                <Select onSelectedChange={(val: Selected<number> | undefined) => currentLanguage = val?.value}>
                    <SelectTrigger class="rounded-xl border border-white text-white outline-none text-sm px-2 bg-zinc-900">
                        {triggerCurrentLanguage}
                    </SelectTrigger>
                    <SelectContent class="bg-zinc-900 text-[#db55f3]">
                        <SelectGroup>
                            {#each languages as lang }
                                <SelectItem value={lang.value} label={lang.label}>
                                    {lang.label}
                                </SelectItem>
                            {/each}
                        </SelectGroup>
                    </SelectContent>
                </Select>
            </div>
        </div>
    </div>
</div>