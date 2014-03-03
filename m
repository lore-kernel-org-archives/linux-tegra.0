From: Tim Harvey <tharvey@gateworks.com>
Subject: Re: [PATCH 0/7] PCI irq mapping fixes and cleanups
Date: Mon, 3 Mar 2014 09:49:52 -0800
Message-ID: <CAJ+vNU3UL+LTWnoxW7scAig19=z2xoYCA-HZ6a7GUyGEXtKK9Q@mail.gmail.com>
References: <1393608523-17509-1-git-send-email-l.stach@pengutronix.de>
	<CAJ+vNU2VN5haOU2GN5o7UUg9vgYh06pAhvDaoGw6EzTBEbD0mg@mail.gmail.com>
	<20140301183059.GA6315@obsidianresearch.com>
	<000601cf36b8$330b3a90$9921afb0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <000601cf36b8$330b3a90$9921afb0$%han@samsung.com>
Sender: linux-sh-owner@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, Richard Zhu <r65037@freescale.com>, Sascha Hauer <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Bjorn Helgaas <bhelgaas@google.com>, Simon Horman <horms@verge.net.au>, Thierry Reding <thierry.reding@gmail.com>, Ben Dooks <ben-linux@fluff.org>, linux-tegra@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Shawn Guo <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 3, 2014 at 12:11 AM, Jingoo Han <jg1.han@samsung.com> wrote:
> On Sunday, March 02, 2014 3:31 AM, Jason Gunthorpe wrote:
>> On Fri, Feb 28, 2014 at 04:53:33PM -0800, Tim Harvey wrote:
>>
>> > In testing this on IMX6 I'm finding that 'of_irq_parse_and_map_pci()'
>> > always returns -EINVAL because it can't find a dt node for the host
>> > bridge:
>> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/of/of_pci_irq.c#n60.
>>
>> There may be some kind of issue in the pcie-designware.c:
>>
>> static struct pci_bus *dw_pcie_scan_bus(int nr, struct pci_sys_data *sys)
>> {
>>         struct pci_bus *bus;
>>         struct pcie_port *pp = sys_to_pcie(sys);
>>
>>         if (pp) {
>>                 pp->root_bus_nr = sys->busnr;
>>                 bus = pci_scan_root_bus(NULL, sys->busnr, &dw_pcie_ops,
>>                                      ^^^^^^^^^^^
>>                                      Shouldn't be null for DT cases.
>>
>> Perhaps since the driver doesn't pass in a parent pointer, no parent
>> device is associated with the struct pci_bus that gets created, so
>> pci_bus_to_OF_node will always fail and the DT PCI mechanisms become
>> broken.
>
> Jason,
> Thank you for your advice. :-)

Jason,

Yes thank you - this does eliminate the -EINVAL from
of_irq_parse_pci() but something still is wrong (see below)

>
> Tim,
> I tested the following as Jason guided.

Jingoo,

Did you test this on in a configuration where devices are behind a
PCIe switch?  I'm still not getting the right IRQ's for that
configuration.

I'm working with the following patch:
diff --git a/drivers/pci/host/pcie-designware.c b/drivers/pci/host/pcie-designwa
index 3e0c2af..a563a8d 100644
--- a/drivers/pci/host/pcie-designware.c
+++ b/drivers/pci/host/pcie-designware.c
@@ -493,7 +493,7 @@ int __init dw_pcie_host_init(struct pcie_port *pp)
        dw_pci.nr_controllers = 1;
        dw_pci.private_data = (void **)&pp;

-       pci_common_init(&dw_pci);
+       pci_common_init_dev(pp->dev, &dw_pci);
        pci_assign_unassigned_resources();
 #ifdef CONFIG_PCI_DOMAINS
        dw_pci.domain++;
@@ -726,7 +726,7 @@ static struct pci_bus *dw_pcie_scan_bus(int nr, struct pci_s

        if (pp) {
                pp->root_bus_nr = sys->busnr;
-               bus = pci_scan_root_bus(NULL, sys->busnr, &dw_pcie_ops,
+               bus = pci_scan_root_bus(pp->dev, sys->busnr, &dw_pcie_ops,
                                        sys, &sys->resources);
        } else {
                bus = NULL;
@@ -742,6 +742,8 @@ static int dw_pcie_map_irq(const struct pci_dev *dev, u8 slo
        int irq;

        irq = of_irq_parse_and_map_pci(dev, slot, pin);
+       dev_info(&dev->dev, "%s: %04x:%04x slot%d pin%d irq%d\n",
+               __func__, dev->vendor, dev->device, slot, pin, irq);
        if (!irq)
                irq = pp->irq;


The configuration I'm testing is:
root@OpenWrt:/# lspci -n
00:00.0 0604: 16c3:abcd (rev 01)
01:00.0 0604: 10b5:8609 (rev ba)
01:00.1 0880: 10b5:8609 (rev ba)
02:01.0 0604: 10b5:8609 (rev ba)
02:04.0 0604: 10b5:8609 (rev ba)
02:05.0 0604: 10b5:8609 (rev ba)
02:06.0 0604: 10b5:8609 (rev ba)
02:07.0 0604: 10b5:8609 (rev ba)
02:08.0 0604: 10b5:8609 (rev ba)
02:09.0 0604: 10b5:8609 (rev ba)
07:00.0 0280: 168c:002b (rev 01)
08:00.0 0200: 11ab:4380
root@OpenWrt:/# lspci -tnv
-[0000:00]---00.0-[01-09]--+-00.0-[02-09]--+-01.0-[03]--
                           |               +-04.0-[04]--
                           |               +-05.0-[05]--
                           |               +-06.0-[06]--
                           |               +-07.0-[07]----00.0  168c:002b
                           |               +-08.0-[08]----00.0  11ab:4380
                           |               \-09.0-[09]--
                           \-00.1  10b5:8609


The dev_info showing what of_irq_parse_and_map_pci() above produces:
[    1.818485] pci 0000:00:00.0: dw_pcie_map_irq: 16c3:abcd slot0 pin1 irq20
[    1.818703] pci 0000:01:00.0: dw_pcie_map_irq: 10b5:8609 slot0 pin1 irq20
[    1.818939] pci 0000:01:00.1: dw_pcie_map_irq: 10b5:8609 slot0 pin2 irq0
[    1.819179] pci 0000:02:01.0: dw_pcie_map_irq: 10b5:8609 slot0 pin2 irq0
[    1.819395] pci 0000:02:04.0: dw_pcie_map_irq: 10b5:8609 slot0 pin1 irq20
[    1.819631] pci 0000:02:05.0: dw_pcie_map_irq: 10b5:8609 slot0 pin2 irq0
[    1.819859] pci 0000:02:06.0: dw_pcie_map_irq: 10b5:8609 slot0 pin3 irq0
[    1.820087] pci 0000:02:07.0: dw_pcie_map_irq: 10b5:8609 slot0 pin4 irq0
[    1.820404] pci 0000:02:08.0: dw_pcie_map_irq: 10b5:8609 slot0 pin1 irq20
[    1.820650] pci 0000:02:09.0: dw_pcie_map_irq: 10b5:8609 slot0 pin2 irq0
[    1.820881] pci 0000:07:00.0: dw_pcie_map_irq: 168c:002b slot0 pin4 irq0
[    1.821100] pci 0000:08:00.0: dw_pcie_map_irq: 11ab:4380 slot0 pin1 irq20

I'm not clear why irq 20 is getting returned for all the slots with
(slot%4)=0 and func=0.  If I start debugging of_irq_parse_pci() I see
that it walks up the tree until it gets to the pcie host controller
then calls of_irq_parse_raw() which is returning irq20 or -EINVAL.

Tim

> You can test i.MX PCIe with this.
>
> ./drivers/pci/host/pcie-designware.c
> @@ -726,7 +727,7 @@ static struct pci_bus *dw_pcie_scan_bus(int nr, struct pci_sys_data *sys)
>
>         if (pp) {
>                 pp->root_bus_nr = sys->busnr;
> -               bus = pci_scan_root_bus(NULL, sys->busnr, &dw_pcie_ops,
> +               bus = pci_scan_root_bus(pp->dev, sys->busnr, &dw_pcie_ops,
>                                         sys, &sys->resources);
>         } else {
>                 bus = NULL;
>
> However, I think that we may need to replace 'pci_common_init()'
> with 'pci_common_init_dev()'.
>
> Best regards,
> Jingoo Han
>
