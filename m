From: wangyijing <wangyijing@huawei.com>
Subject: Re: [PATCH v1 00/25] PCI: Request host bridge window resources
Date: Wed, 22 Jun 2016 09:07:57 +0800
Message-ID: <5769E4ED.4050904@huawei.com>
References: <20160606225630.20936.77349.stgit@bhelgaas-glaptop2.roam.corp.google.com>
 <20160618180735.GB20504@localhost> <57692BD0.6030609@huawei.com>
 <20160621150352.GB31917@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160621150352.GB31917@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, linux-pci@vger.kernel.org, Pratyush Anand <pratyush.anand@gmail.com>, linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>, rfi@lists.rocketboards.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, Thierry Reding <thierry.reding@gmail.com>, Tanmay Inamdar <tinamdar@apm.com>, Jingoo Han <jingoohan1@gmail.com>, linux-tegra@vger.kernel.org, Ley Foon Tan <lftan@altera.com>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org



=E5=9C=A8 2016/6/21 23:03, Bjorn Helgaas =E5=86=99=E9=81=93:
> On Tue, Jun 21, 2016 at 07:58:08PM +0800, wangyijing wrote:
>> Hi Bjorn, use devm_request_resource() for host bridge resource is co=
ol,
>> what about do the similar change for x86, now we request host bridge=
 resource
>> in pci_acpi_root_add_resources() in x86, and we would release the ho=
st bridge
>> resource when host bridge device refcount reach 0. This logic may in=
troduce issue,
>> E.g.
>> If we try to remove a pci host bridge, but there is a child pci devi=
ce which refcount
>> cannot decrease to 0 after remove the device, in this case, its pare=
nt pci_bus and
>> parent device, all their refcount cannot reach to 0, the result is p=
ci host bridge
>> refcount can not reach 0, so its .release_fn() won't be called, and =
host bridge
>> resouces can not release. If we want to add the pci host bridge agai=
n, all pci devices
>> can not work because the resource is conflict with the old.
>>
>> devm resource would be released when the driver detach, this is bett=
er than what we do now, I think.
>=20
> I'm not going to convert pci_root.c to use devm right now.  That migh=
t
> be a good thing, but this current series is mostly trivial.  I think
> changing pci_root.c would not be trivial, so that looks like a projec=
t
> all by itself.

OK.

>=20
> I don't quite follow the example of removing a host bridge while a
> child PCI device refcount is non-zero.  That sounds like an invalid
> scenario regardless of whether the resources are released by a
> .release_fn() or by devm.

I would send a draft patch to describe and fix the issue, because it's =
not related to
this series, so let's discuess it in another thread. :)

Thanks!
Yijing.


>=20
> Bjorn
>=20
> .
>=20
