From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: update defconfig to support more paz00 hardware
Date: Mon, 20 Aug 2012 11:14:16 -0600
Message-ID: <50327068.6010705@wwwdotorg.org>
References: <2895bbda75127f208239e07dbbcf79e718cf684f.1345309601.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2895bbda75127f208239e07dbbcf79e718cf684f.1345309601.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/18/2012 11:10 AM, Marc Dietrich wrote:
> This update adds various devices found on the usb bus on PAZ00 boards:
> 
> 	- Wifi chip (rt3070)
> 	- Bluetooth (btusb)
> 	- Camera (uvcvideo)
> 	- 3G modem (acm and wdm)
> 
> These are enabled as modules because they are not needed for boot and
> will not be used on other boards. Wifi also needs to be module because
> of the firmware loader.
> 
> The update also enabled support for the rfkill switch, the Wifi LED and
> the nvec power and led driver which got lost in the past.
> 
> Finally, devtmpfs and tmpfs acls are enabled because they are mandatory
> on modern linux distros.

Thanks, applied to Tegra's for-3.7/defconfig branch.
