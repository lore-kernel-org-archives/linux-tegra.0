From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v4 16/23] ASoC: soc-pcm: Get all BEs along DAPM path
Date: Mon, 29 Jun 2020 22:59:15 +0530
Message-ID: <d45bf2fc-3baa-fd68-4d96-345ab7b99df9@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-17-git-send-email-spujar@nvidia.com>
 <871rly1wem.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <871rly1wem.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-GB
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: jonathanh@nvidia.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, atalambedu@nvidia.com, swarren@nvidia.com, linux-kernel@vger.kernel.org, spujar@nvidia.com, nwartikar@nvidia.com, lgirdwood@gmail.com, robh+dt@kernel.org, tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com, broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org, digetx@gmail.com, rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
List-Id: linux-tegra@vger.kernel.org



On 6/29/2020 7:11 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>> dpcm_end_walk_at_be() stops the graph walk when first BE is found for
>> the given FE component. In a component model we may want to connect
>> multiple DAIs from different components. A new flag is introduced in
>> 'snd_soc_card', which when set allows DAI/component chaining. Later
>> PCM operations can be called for all these listed components for a
>> valid DAPM path.
> (snip)
>> @@ -1069,6 +1069,7 @@ struct snd_soc_card {
>>        int num_of_dapm_widgets;
>>        const struct snd_soc_dapm_route *of_dapm_routes;
>>        int num_of_dapm_routes;
>> +     bool component_chaining;
> snd_soc_card has many /* bit field */ variables.
> Please use it instead of bool.

OK, will use.
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
