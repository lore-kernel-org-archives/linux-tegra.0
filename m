From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: defconfig updates
Date: Mon, 15 Jul 2013 12:28:01 -0600
Message-ID: <51E43F31.6030401@wwwdotorg.org>
References: <8e7853ceafe5a53e52ef451e1c0d515a01aae62e.1372003325.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8e7853ceafe5a53e52ef451e1c0d515a01aae62e.1372003325.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/23/2013 10:03 AM, Marc Dietrich wrote:
> Enable:
> 	* SYSVIPC (needed for some apps, e.g. fakeroot)
> 	* Elantech touchpad (touchpad on AC100)

Applied to Tegra's for-3.12/defconfig branch.

Note that I'll squash any future defconfig changes into this.
