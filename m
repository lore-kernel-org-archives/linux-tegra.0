From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/4] xhci: Introduce xhci_init_driver()
Date: Tue, 19 Aug 2014 09:59:15 -0700
Message-ID: <CAL1qeaEkqSHnia=Pc1LMapuwuNhWyU9k-6fb3OhV9y=mUPEAag@mail.gmail.com>
References: <1408378343-9352-1-git-send-email-abrestic@chromium.org>
	<1408378343-9352-2-git-send-email-abrestic@chromium.org>
	<53F2EA5C.1020403@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53F2EA5C.1020403-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 18, 2014 at 11:10 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> Hi,
>
> (2014/08/19 1:12), Andrew Bresticker wrote:
>> Since the struct hc_driver is mostly the same across the xhci-pci,
>> xhci-plat, and the upcoming xhci-tegra driver, introduce the function
>> xhci_init_driver() which will populate the hc_driver with the default
>> xHCI operations.  The caller must supply a setup function which will
>> be used as the hc_driver's reset callback.
>>
>> Note that xhci-plat also overrides the default ->start() callback so
>> that it can do rcar-specific initialization.
>>
>> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>> Changes from v1:
>>  - rebased on changes introduced by xhci-rcar driver
> < snip >
>> @@ -300,6 +249,8 @@ MODULE_ALIAS("platform:xhci-hcd");
>>
>>  int xhci_register_plat(void)
>>  {
>> +     xhci_init_driver(&xhci_plat_hc_driver, xhci_plat_setup);
>> +     xhci_plat_hc_drver.start = xhci_plat_start;
>
> Thank you for the care of xhci-rcar driver.
> However, this "xhci_plat_hc_drver" should be "xhci_plat_hc_driver".

D'oh!  Thanks for catching this... had it fixed in my tree but forgot
to update the patches.  v3 incoming.
