From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v3] arm/tegra: emc: convert tegra2_emc to a platform driver
Date: Thu, 5 Jan 2012 17:36:46 -0800
Message-ID: <CAOesGMg7e4bVjyzZ25VarPVFvMpGcKioVSDN=Esn9u6S4idRoA@mail.gmail.com>
References: <1325742994-1178-1-git-send-email-olof@lixom.net>
	<1325743288-2460-1-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF17761F1818@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17761F1818-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 5, 2012 at 2:14 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
> Olof Johansson wrote at Wednesday, January 04, 2012 11:01 PM:
>> This is the first step in making it device-tree aware and get rid of=
 the
>> in-kernel EMC tables (of which there are none in mainline, thankfull=
y).
>>
>> Changes since v2:
>>
>> * D'oh -- missed a couple of variables that were added, never used a=
nd then
>> =A0 later removed in a later patch.
>>
>> Changes since v1:
>>
>> * Fixed messed up indentation
>> * Removed code that should be gone (was added here and removed later=
 in series)
>>
>> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> ...
>> diff --git a/arch/arm/mach-tegra/tegra2_emc.c b/arch/arm/mach-tegra/=
tegra2_emc.c
> ...
>> +static int __devinit tegra_emc_probe(struct platform_device *pdev)
> ...
>> + =A0 =A0 if (!request_mem_region(res->start, resource_size(res), "t=
egra_emc")) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "failed to request reg=
ister region\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EBUSY;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 emc_regbase =3D ioremap(res->start, resource_size(res));
>
> Don't you need to error-check the ioremap() result, and undo the
> request_mem_region() too? Or, use the devm variant to request the
> region. The rest of the code checks emc_pdev!=3DNULL which won't dete=
ct
> this failure.
>
> Isn't there a get_resource && request && remap function now; I think =
I
> recall a patch that wraps all that into one function, but it might ha=
ve
> been DT-only.

Nope, it's there -- devm_request_and_ioremap(). I'll move it over to
that and repost, it's a good idea.


-Olof
