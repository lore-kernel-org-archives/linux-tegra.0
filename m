From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V1 04/10] thermal: tegra: add T210-specific SOC_THERM
 driver
Date: Thu, 14 Jan 2016 18:18:52 +0800
Message-ID: <5697760C.1000901@nvidia.com>
References: <1452671929-32740-1-git-send-email-wni@nvidia.com> <1452671929-32740-5-git-send-email-wni@nvidia.com> <20160113150656.GD2588@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160113150656.GD2588@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 2016=E5=B9=B401=E6=9C=8813=E6=97=A5 23:06, Thierry Reding wrote:
> * PGP Signed by an unknown key
>=20
> On Wed, Jan 13, 2016 at 03:58:43PM +0800, Wei Ni wrote:
> [...]
>> diff --git a/drivers/thermal/tegra/tegra_soctherm_fuse.c b/drivers/t=
hermal/tegra/tegra_soctherm_fuse.c
>> index 7c608698f1ae..22f402240672 100644
>> --- a/drivers/thermal/tegra/tegra_soctherm_fuse.c
>> +++ b/drivers/thermal/tegra/tegra_soctherm_fuse.c
>> @@ -28,6 +28,17 @@
>>  #define FUSE_TSENSOR_COMMON			0x180
>> =20
>>  /*
>> + * T210: Layout of bits in FUSE_TSENSOR_COMMON:
>> + *    3                   2                   1                   0
>> + *  1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
>> + * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-=
+
>> + * |       BASE_FT       |      BASE_CP      | SHFT_FT | SHIFT_CP  =
|
>> + * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-=
+
>> + *
>> + * In chips prior to T210, this fuse was incorrectly sized as 26 bi=
ts,
>> + * and didn't hold SHIFT_CP in [31:26]. Therefore these missing six=
 bits
>=20
> The above diagram aso doesn't contain SHIFT_CP in bits [31:26] but
> rather in bits [5:0]. Which one is correct: the text or the diagram?

Hmm, sorry for the confusion. The diagram is for Tegra210, and the text=
 is used
to explain why the Tegra124 would use the FUSE_SPARE_REALIGNMENT_REG.
=46or Tegra210, the FUSE_TSENSOR_COMMON contain four values, including =
SHIFT_CP in
the bits of [5:0]
But for Tegra124, the FUSE_TSENSOR_COMMON only contain three values, th=
e
SHIFT_CP is in the FUSE_SPARE_REALIGNMENT_REG which didn't be used in T=
egra210.
I will move the text under the line of "* T12x, etc: FUSE_TSENSOR_COMMO=
N:", so
that it will be more readable.

>=20
> Thierry
>=20
> * Unknown Key
> * 0x7F3EB3A1
>=20
