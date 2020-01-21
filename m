From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH 4/9] ASoC: tegra: add Tegra210 based I2S
 driver
Date: Tue, 21 Jan 2020 19:03:15 +0300
Message-ID: <444731da-c4cd-8578-a732-c803eef31ef0@gmail.com>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-5-git-send-email-spujar@nvidia.com>
 <a440d105-8db9-ecf1-3718-e58804ce14b8@gmail.com>
 <0c571858-d72c-97c2-2d6a-ead6fdde06eb@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0c571858-d72c-97c2-2d6a-ead6fdde06eb-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

21.01.2020 17:21, Sameer Pujar пишет:

[snip]

>>> +static int tegra210_i2s_put_control(struct snd_kcontrol *kcontrol,
>>> +     struct snd_ctl_elem_value *ucontrol)
>> Checkpatch should complain about the wrong indentation here.
> 
> I had run checkpatch before sending the patch, below is the result.
> -----
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #70:
> new file mode 100644
> 
> total: 0 errors, 1 warnings, 1103 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or
> --fix-inplace.
> -----

Using 'checkpatch --strict':

CHECK: Alignment should match open parenthesis
#2693: FILE: sound/soc/tegra/tegra210_i2s.c:362:
+static int tegra210_i2s_put_control(struct snd_kcontrol *kcontrol,
+       struct snd_ctl_elem_value *ucontrol

[snip]

>>> +
>>> +     } else if (strstr(kcontrol->id.name, "Playback Audio Bit Format"))
>>> +             i2s->audio_fmt_override[I2S_RX_PATH] = value;
>>> +     else if (strstr(kcontrol->id.name, "Capture Audio Bit Format"))
>>> +             i2s->audio_fmt_override[I2S_TX_PATH] = value;
>>> +     else if (strstr(kcontrol->id.name, "Client Bit Format"))
>>> +             i2s->client_fmt_override = value;
>>> +     else if (strstr(kcontrol->id.name, "Playback Audio Channels"))
>>> +             i2s->audio_ch_override[I2S_RX_PATH] = value;
>>> +     else if (strstr(kcontrol->id.name, "Capture Audio Channels"))
>>> +             i2s->audio_ch_override[I2S_TX_PATH] = value;
>>> +     else if (strstr(kcontrol->id.name, "Client Channels"))
>>> +             i2s->client_ch_override = value;
>>> +     else if (strstr(kcontrol->id.name, "Capture Stereo To Mono"))
>>> +             i2s->stereo_to_mono[I2S_TX_PATH] = value;
>>> +     else if (strstr(kcontrol->id.name, "Capture Mono To Stereo"))
>>> +             i2s->mono_to_stereo[I2S_TX_PATH] = value;
>>> +     else if (strstr(kcontrol->id.name, "Playback Stereo To Mono"))
>>> +             i2s->stereo_to_mono[I2S_RX_PATH] = value;
>>> +     else if (strstr(kcontrol->id.name, "Playback Mono To Stereo"))
>>> +             i2s->mono_to_stereo[I2S_RX_PATH] = value;
>>> +     else if (strstr(kcontrol->id.name, "Playback FIFO Threshold"))
>>> +             i2s->rx_fifo_th = value;
>>> +     else if (strstr(kcontrol->id.name, "BCLK Ratio"))
>>> +             i2s->bclk_ratio = value;
>> I'm pretty sure that checkpatch should complain about the missing
>> brackets, they should make code's indentation uniform and thus easier to
>> read. Same for all other occurrences in the code.
> 
> same as above

CHECK: braces {} should be used on all arms of this statement
#2699: FILE: sound/soc/tegra/tegra210_i2s.c:368:
+       if (strstr(kcontrol->id.name, "Loopback")) {
[...]
+       } else if (strstr(kcontrol->id.name, "Sample Rate"))
[...]
+       else if (strstr(kcontrol->id.name, "FSYNC Width")) {
[...]
+       } else if (strstr(kcontrol->id.name, "Playback Audio Bit Format"))
[...]
+       else if (strstr(kcontrol->id.name, "Capture Audio Bit Format"))
[...]
+       else if (strstr(kcontrol->id.name, "Client Bit Format"))
[...]
+       else if (strstr(kcontrol->id.name, "Playback Audio Channels"))
[...]
+       else if (strstr(kcontrol->id.name, "Capture Audio Channels"))
[...]
+       else if (strstr(kcontrol->id.name, "Client Channels"))
[...]
+       else if (strstr(kcontrol->id.name, "Capture Stereo To Mono"))
[...]
+       else if (strstr(kcontrol->id.name, "Capture Mono To Stereo"))
[...]
+       else if (strstr(kcontrol->id.name, "Playback Stereo To Mono"))
[...]
+       else if (strstr(kcontrol->id.name, "Playback Mono To Stereo"))
[...]
+       else if (strstr(kcontrol->id.name, "Playback FIFO Threshold"))
[...]
+       else if (strstr(kcontrol->id.name, "BCLK Ratio"))
[...]

[snip]

>>> +     pm_runtime_enable(dev);
>> Error checking?
> 
> return type for above is void()

Ok

>>> +     return 0;
>>> +}
>>> +
>>> +static int tegra210_i2s_remove(struct platform_device *pdev)
>>> +{
>>> +     pm_runtime_disable(&pdev->dev);
>>> +     if (!pm_runtime_status_suspended(&pdev->dev))
>>> +             tegra210_i2s_runtime_suspend(&pdev->dev);
>> This breaks device's RPM refcounting if it was disabled in the active
>> state. This code should be removed. At most you could warn about the
>> unxpected RPM state here, but it shouldn't be necessary.
> 
> I guess this was added for safety and explicit suspend keeps clock
> disabled.
> Not sure if ref-counting of the device matters when runtime PM is
> disabled and device is removed.
> I see few drivers using this way.

It should matter (if I'm not missing something) because RPM should be in
a wrecked state once you'll try to re-load the driver's module. Likely
that those few other drivers are wrong.

[snip]

> 
>>> +     int rx_fifo_th;
>> Could rx_fifo_th be negative?
> 
> rx_fifo_th itself does not take negative values, explicit typecasting> is avoided in "if" condition by declaring this as "int"
Explicit typecasting isn't needed for integers.
