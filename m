From: Curtis Malainey <cujomalainey@google.com>
Subject: Re: Regression: ASoC: soc-core: clear platform pointers on error
Date: Fri, 1 Mar 2019 09:28:59 -0800
Message-ID: <CAOReqxhYUASVFdrHzKEr8F_NA0CNnJ1Hx51L4ganvcrK=dSCCA@mail.gmail.com>
References: <bbc0d37a-5a08-9ce0-58b6-c89d28c558ce@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bbc0d37a-5a08-9ce0-58b6-c89d28c558ce@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, Curtis Malainey <cujomalainey@chromium.org>, linux-tegra <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 1, 2019 at 4:07 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>
> Hi Mark, Curtis,
>
> I am seeing a regression on -next where the soundcard on one of our
> Tegra boards fails to initialise following a probe deferral. The bisect
> points to the commit 78a24e10cd94420f1b4e2dc5923ae7109e2aaba1 ('ASoC:
> soc-core: clear platform pointers on error') and reverting this on top
> of -next fixes the problem.
>
> Looking at the bootlog from the failure I see ...
>
>  tegra-snd-wm8903 sound: ASoC: failed to init link WM8903
>
>  tegra-snd-wm8903 sound: snd_soc_register_card failed (-517)
>
>  tegra30-i2s 70080400.i2s: DMA channels sourced from device 70080000.ahub
>
>  tegra-snd-wm8903 sound: ASoC: Both platform name/of_node are set for WM8903
>
>  tegra-snd-wm8903 sound: ASoC: failed to init link WM8903
>
>  tegra-snd-wm8903 sound: snd_soc_register_card failed (-22)
>
>  tegra-snd-wm8903: probe of sound failed with error -22
>
>
> With the above change I see soc_cleanup_platform() is ever being called
> when the probe is deferred and hence leads to the failure. Note that the
> initial failure, "ASoC: failed to init link WM8903" occurs very early
> in snd_soc_register_card() when initialising the prelinks.
>
> The following fixes it, but I have not scrutinised the code to see if
> there are other exit points that we need to handle.
>
You are indeed correct. That should be there. I think I got confused
when I was doing my initial debugging on our local 4.19 kernel as the
cleanup code had changed when I was testing on -next and forgot to add
this to my upstream patch and it wasn't caught in my testing. Thanks
for catching this. I went back and looked and it appears that is the
only call to soc_init_dai_link that is outside soc_instantiate_card
and therefore not caught by the original patch's cleanup routine. Do
you want to submit a patch and I'll add my signoff?
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 93d316d5bf8e..6f66beb0c3ae 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2797,6 +2797,7 @@ int snd_soc_register_card(struct snd_soc_card *card)
>
>                 ret = soc_init_dai_link(card, link);
>                 if (ret) {
> +                       soc_cleanup_platform(card);
>                         dev_err(card->dev, "ASoC: failed to init link %s\n",
>                                 link->name);
>                         mutex_unlock(&client_mutex);
>
> Cheers
> Jon
>
> --
> nvpublic
