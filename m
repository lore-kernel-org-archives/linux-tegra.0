From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 10/10] Usb: Move PORTSC access to PHY
Date: Fri, 10 May 2013 14:04:26 -0600
Message-ID: <518D52CA.7000100@wwwdotorg.org>
References: <1368194051-4925-1-git-send-email-vbyravarasu@nvidia.com> <1368194051-4925-11-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368194051-4925-11-git-send-email-vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/10/2013 07:54 AM, Venu Byravarasu wrote:
> Changes with this patch:
> 1. As PHY is being registered as separate platform driver & EHCI Tegra
> is no more calling PHY open, moved tegra_ehci_set_pts & tegra_ehci_set_phcd
> functions to PHY driver,
> 
> 2. Removed unused defines for multiple USB port base addresses

This patch (mostly?) is a revert of bbdabdb "usb: add APIs to access
host registers from Tegra PHY". I don't think we want to revert this[1].

Instead, once patch 9/10 in this series is applied, the Tegra EHCI
module should no longer directly reference any symbols in the Tegra USB
PHY module. This is because the functions exposed by the Tegra PHY
module are now accessed using the new standard PHY APIs, rather than
directly by symbol name.

Assuming that's true, it is then permissible for the Tegra PHY module to
once again directly reference symbols exported by the Tegra EHCI module.
So, instead of moving the functions from the EHCI code to the PHY code,
keep them in the EHCI code, and call them from the PHY code, but call
them by function name instead of by function pointer. That way, there's
no need to pass the function pointers during initialization.

You will have to roll that change into patch 9/10 to make git bisect work.


[1] The background is that NVIDIA HW has added some non-standard
register bits to the PORTSC register, related to PHY control. The PHY
driver needs to control those bits, but they're in the EHCI register
space. Since the non-standard bits are controlled by read-modify-write,
the EHCI driver should implement the register accesses, so the it can
implement locking against its own read-modify-write of that register if
required.
