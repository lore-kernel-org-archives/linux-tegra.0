From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH V2 5/6] USB: EHCI: tegra: fix circular module dependencies
Date: Wed, 5 Jun 2013 10:26:34 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1306051024200.1078-100000@iolanthe.rowland.org>
References: <1370390014-25452-6-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370390014-25452-6-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 4 Jun 2013, Stephen Warren wrote:

> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The Tegra EHCI driver directly calls various functions in the Tegra USB
> PHY driver. The reverse is also true; the PHY driver calls into the EHCI
> driver. This is problematic when the two are built as modules.
> 
> The calls from the PHY to EHCI driver were originally added in commit
> bbdabdb "usb: add APIs to access host registers from Tegra PHY", for the
> following reasons:
> 
> 1) The register being touched is an EHCI register, so logically only the
>    EHCI driver should touch it.
> 2) (1) implies that some locking may be needed to correctly implement the
>    r/m/w access to this shared register.
> 3) We were expecting to pass only the PHY register space to the Tegra PHY
>    driver, and hence it would not have access to touch the shared
>    registers.
> 
> To solve this, that commit added functions in the EHCI driver to touch the
> shared register on behalf of the PHY driver.
> 
> In practice, we ended up not having any locking in the implementaiton of
> those functions, and I've been led to believe this is safe. Equally, (3)
> did not happen either. Hence, it is possible for the PHY driver to touch
> the shared register directly.
> 
> Given that, this patch moves the code to touch the shared register back
> into the PHY driver, to eliminate the module problems. If we actually
> need locking or co-ordination in the future, I propose we put the lock
> support into some pre-existing core module, or into a third separate
> module, in order to avoid the circular dependencies.
> 
> I apologize for my contribution to code churn here.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2: No change; just rebased on new versions of earlier patches.

I didn't bother to look in detail for possible future conflicts.  
Presumably we will be able to handle them as they arise.  Assuming the 
PHY needs adjustment only during probe, removal, suspend, and resume, 
we should be okay without locking.

Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
