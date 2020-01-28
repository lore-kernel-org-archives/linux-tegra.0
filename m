From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
Date: Tue, 28 Jan 2020 18:19:19 +0000
Message-ID: <70f344bf-f991-606c-55ab-bdadea27d233@nvidia.com>
References: <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <20200128121315.GD4689@sirena.org.uk>
 <047c8caa-e715-5295-9794-67ff3e10cea2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <047c8caa-e715-5295-9794-67ff3e10cea2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Edward Cragg <edward.cragg-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 28/01/2020 17:42, Dmitry Osipenko wrote:
> 28.01.2020 15:13, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On Mon, Jan 27, 2020 at 10:20:25PM +0300, Dmitry Osipenko wrote:
>>> 24.01.2020 19:50, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>>>>                 .rates =3D SNDRV_PCM_RATE_8000_96000,
>>>>                 .formats =3D SNDRV_PCM_FMTBIT_S32_LE |
>>>> -                          SNDRV_PCM_FMTBIT_S24_LE |
>>>> +                          SNDRV_PCM_FMTBIT_S24_3LE |
>>
>>> It should solve the problem in my particular case, but I'm not sure tha=
t
>>> the solution is correct.
>>
>> If the format implemented by the driver is S24_3LE the driver should
>> advertise S24_3LE.
>=20
> It should be S24_LE, but seems we still don't know for sure.

Why?

>>> The v5.5 kernel is released now with the broken audio and apparently
>>> getting 24bit to work won't be trivial (if possible at all). Ben, could
>>> you please send a patch to fix v5.5 by removing the S24 support
>>> advertisement from the driver?
>>
>> Why is that the best fix rather than just advertising the format
>> implemented by the driver?
>=20
> The currently supported format that is known to work well is S16_LE.
>=20
> I'm suggesting to drop the S24_LE and S32_LE that were added by the
> applied patches simply because this series wasn't tested properly before
> it was sent out and turned out that it doesn't work well.

S32_LE should be fine, however, I do have some concerns about S24_LE.

Jon

--=20
nvpublic
