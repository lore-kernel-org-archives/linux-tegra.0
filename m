From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: emc: correction of ram-code parsing from
 dt
Date: Mon, 20 May 2013 14:06:09 +0400
Message-ID: <5199F591.80409@gmail.com>
References: <1368390409-14156-1-git-send-email-digetx@gmail.com> <5196C2EF.2060408@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5196C2EF.2060408-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

18.05.2013 03:53, Stephen Warren =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 05/12/2013 02:26 PM, Dmitry Osipenko wrote:
>> Change tegra_emc_ramcode_devnode() to get ram-code from child node i=
nstead of
>> parent.
>=20
> I've applied this to Tegra's for-3.11/soc branch.
>=20

Thanks.

>> For me it looks like it should be better to place ram-code inside of=
 table
>> nodes, so num_tables will be incremented if table has valid ram-code=
 and table
>> with invalid ram-code will be skipped on getting table params loop. =
This avoids
>> placing of #address-cells and #size-cells in nodes with ram-code.
>> If it looks ok, I may send new patch.
>=20
> That would be a change to the DT binding. DT bindings are supposed to=
 be
> a stable ABI, so we wouldn't want to change the binding unless there =
was
> a strong reason. I don't think there is one here.
>=20

Ok.
