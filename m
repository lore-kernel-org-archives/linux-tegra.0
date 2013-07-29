From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 2/3] Documentation: devicetree: phy-tegra-usb: Add
 vbus-supply property for host mode PHYs
Date: Mon, 29 Jul 2013 09:24:46 -0600
Message-ID: <51F6893E.6070604@wwwdotorg.org>
References: <1372422796-23524-1-git-send-email-mperttunen@nvidia.com> <1372422796-23524-3-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372422796-23524-3-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/28/2013 06:33 AM, Mikko Perttunen wrote:
> Add vbus-supply as an optional property for host mode phy-tegra-usb PHYs.

Felipe, I see that you didn't merge this one patch from this series. Was
there a reason for that? At this stage, I would consider it reasonable
for DT binding documentation changes to go through the same tree as
driver changes.
