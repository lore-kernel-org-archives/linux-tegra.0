From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] Revert "ASoC: tegra: Allow 24bit and 32bit samples"
Date: Fri, 31 Jan 2020 16:08:18 +0000
Message-ID: <7fafb8d2-8754-e5c0-8952-0253ba8b656a@nvidia.com>
References: <20200131091901.13014-1-jonathanh@nvidia.com>
 <2bb53d7d-2d36-e16e-5858-24360b19f936@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2bb53d7d-2d36-e16e-5858-24360b19f936-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 31/01/2020 15:38, Dmitry Osipenko wrote:
> 31.01.2020 12:19, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Commit f3ee99087c8ca0ecfdd549ef5a94f557c42d5428 ("ASoC: tegra: Allow
>> 24bit and 32bit samples") added 24-bit and 32-bit support for to the
>> Tegra30 I2S driver. However, there are two additional commits that are
>> also needed to get 24-bit and 32-bit support to work correctly. These
>> commits are not yet applied because there are still some review comments
>> that need to be addressed. With only this change applied, 24-bit and
>> 32-bit support is advertised by the I2S driver, but it does not work and
>> the audio is distorted. Therefore, revert this patch for now until the
>> other changes are also ready.
>>
>> Furthermore, a clock issue with 24-bit support has been identified with
>> this change and so if we revert this now, we can also fix that in the
>> updated version.
>>
>> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>
>> Reported-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>=20
> Thanks, Jon!
>=20
> Tested-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks. I just realised I forgot the fixes-tag ...

Fixes: f3ee99087c8c ("ASoC: tegra: Allow 24bit and 32bit samples")

Mark, let me know if you want me to resend.

Jon

--=20
nvpublic
