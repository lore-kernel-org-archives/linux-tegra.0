From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: pcie: fix return value of function
Date: Tue, 13 Mar 2012 13:36:27 -0600
Message-ID: <4F5FA1BB.5050002@wwwdotorg.org>
References: <CAOesGMi0aqCjLsJ5wWXwFVQL2T8wtUuE14rFZ9h7NKHXcWAoqQ@mail.gmail.com> <1331617587-10714-1-git-send-email-mad_soft@inbox.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331617587-10714-1-git-send-email-mad_soft-aPYA7nAdAYY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Artamonow <mad_soft-aPYA7nAdAYY@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi <andi.shyti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/12/2012 11:46 PM, Dmitry Artamonow wrote:
> In previous patch (arm/tegra: add timeout to PCIe PLL lock detection loop)
> tegra_pcie_enable_controller() function type has been changed from
> void to int, but the last return statement wasn't converted, so
> function returns undefined value. Fix it.
> 
> Also while at it, address couple of minor concerns raised by reviewers:
> use usleep_range for delay, and lower the value of timeout to 300ms
> to be consistent with Nvidia Vibrante kernel.
> 
> Signed-off-by: Dmitry Artamonow <mad_soft-aPYA7nAdAYY@public.gmane.org>

Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
