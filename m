From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] thermal: tegra_soctherm: fix sign bit of temperature
Date: Mon, 7 Mar 2016 16:26:06 +0800
Message-ID: <56DD3B1E.4030805@nvidia.com>
References: <1456739480-3304-1-git-send-email-wni@nvidia.com> <56D698FE.7070706@nvidia.com> <56D78081.6050106@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D78081.6050106-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org
Cc: Matt Longnecker <mlongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi, Rui and Thierry
Could you please take a look at this patch?

Thanks.
Wei.

On 2016=E5=B9=B403=E6=9C=8803=E6=97=A5 08:08, Matt Longnecker wrote:
>=20
>=20
> On 03/01/2016 11:40 PM, Wei Ni wrote:
>> >diff --git a/drivers/thermal/tegra_soctherm.c b/drivers/thermal/teg=
ra_soctherm.c
>> >index 74ea5765938b..136975220c92 100644
>> >--- a/drivers/thermal/tegra_soctherm.c
>> >+++ b/drivers/thermal/tegra_soctherm.c
>> >@@ -57,7 +57,7 @@
>> >  #define READBACK_VALUE_MASK            0xff00
>> >  #define READBACK_VALUE_SHIFT            8
>> >  #define READBACK_ADD_HALF            BIT(7)
>> >-#define READBACK_NEGATE                BIT(1)
>> >+#define READBACK_NEGATE                BIT(0)
> I confirm that this change is technically correct. It fixes a bug.
