From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: pcie: fix return value of function
Date: Sun, 18 Mar 2012 10:27:10 -0700
Message-ID: <20120318172710.GA24110@quad.lixom.net>
References: <CAOesGMi0aqCjLsJ5wWXwFVQL2T8wtUuE14rFZ9h7NKHXcWAoqQ@mail.gmail.com>
 <1331617587-10714-1-git-send-email-mad_soft@inbox.ru>
 <4F5FA1BB.5050002@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F5FA1BB.5050002-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Dmitry Artamonow <mad_soft-aPYA7nAdAYY@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi <andi.shyti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 13, 2012 at 01:36:27PM -0600, Stephen Warren wrote:
> On 03/12/2012 11:46 PM, Dmitry Artamonow wrote:
> > In previous patch (arm/tegra: add timeout to PCIe PLL lock detection loop)
> > tegra_pcie_enable_controller() function type has been changed from
> > void to int, but the last return statement wasn't converted, so
> > function returns undefined value. Fix it.
> > 
> > Also while at it, address couple of minor concerns raised by reviewers:
> > use usleep_range for delay, and lower the value of timeout to 300ms
> > to be consistent with Nvidia Vibrante kernel.
> > 
> > Signed-off-by: Dmitry Artamonow <mad_soft-aPYA7nAdAYY@public.gmane.org>
> 
> Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>

Thanks, applied to for-3.4/cleanups-and-fixes


-Olof
