From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 0/6] USB tree changes for Tegra30 and Tegra114 USB
 Host support
Date: Tue, 06 Aug 2013 13:46:36 -0600
Message-ID: <5201529C.5020409@wwwdotorg.org>
References: <1375812518-3847-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375812518-3847-1-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/06/2013 12:08 PM, Tuomas Tynkkynen wrote:
> Hi all,
> 
> Here are the patches for the USB tree to enable USB Host support on Tegra30 and
> Tegra114. These are based on my and Mikko's cleanup patches that just got
> merged to Felipe's tree.
> 
> The first one touches the core hub code to prevent certain (non-standard) clock
> disable features as our controller doesn't support those.
> The rest are changes to our PHY and EHCI drivers to deal with a few changed
> register addresses and a few additional PHY parameters that need to be set
> for proper signal quality.

The series,

Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

(Tested on all of Tegra20/paz00, Tegra30/Beaver, Tegra114/Dalmore, all
with a USB NIC only)
