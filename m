From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC v2 1/8] video: tegra: Add nvhost driver
Date: Mon, 03 Dec 2012 12:23:32 -0700
Message-ID: <50BCFC34.5030203@wwwdotorg.org>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com> <1353935954-13763-2-git-send-email-tbergstrom@nvidia.com> <20121128212301.GA25531@avionic-0098.adnet.avionic-design.de> <50B73710.2040102@nvidia.com> <20121129114704.GB6150@avionic-0098.adnet.avionic-design.de> <50B874C7.5030208@nvidia.com> <20121130103850.GA28367@avionic-0098.adnet.avionic-design.de> <50B9EA76.10803@nvidia.com> <20121201145814.GB18209@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121201145814.GB18209-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/01/2012 07:58 AM, Thierry Reding wrote:
> On Sat, Dec 01, 2012 at 01:31:02PM +0200, Terje Bergstr=C3=B6m wrote:
=2E..
>> I was thinking of definitions like this:
>>=20
>> static inline u32 host1x_sync_cfpeek_ctrl_cfpeek_addr_f(u32 v) {=20
>> return (v & 0x1ff) << 0; }
>>=20
>> versus
>>=20
>> #define host1x_sync_cfpeek_ctrl_cfpeek_addr_f(v) ((v) >> 16) &
>> 0x3ff
>>=20
>> Both of these produce the same machine code and have same usage,
>> but the latter has type checking and code coverage analysis and
>> the former is (in my eyes) clearer. In both of these cases the
>> usage is like this:
>>=20
>> writel(host1x_sync_cfpeek_ctrl_cfpeek_ena_f(1) |
>> host1x_sync_cfpeek_ctrl_cfpeek_channr_f(chid) |
>> host1x_sync_cfpeek_ctrl_cfpeek_addr_f(rd_ptr), m->sync_aperture +
>> host1x_sync_cfpeek_ctrl_r());
>=20
> Again there's no precedent for doing this with static inline
> functions. You can do the same with macros. Type checking isn't an
> issue in these cases since we're talking about bitfields for which
> no proper type exists.

I suspect the inline functions could encode signed-vs-unsigned fields,
perhaps catch u8 variables when they should have been u32, etc.?
