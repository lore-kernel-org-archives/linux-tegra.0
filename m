From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: tegra20: Rename USB UTMI parameters according
 to new definitions
Date: Wed, 26 Jun 2013 11:44:58 -0600
Message-ID: <51CB289A.2070506@wwwdotorg.org>
References: <1372247927-28470-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372247927-28470-1-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/26/2013 05:58 AM, Mikko Perttunen wrote:
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Damn. I thought that Venu had converted the *.dts files completely to
match the new binding definition in the last series he sent. I guess he
missed these because the driver doesn't use them yet and he wasn't
paying attention. Grrr.

So, this change is fine (modulo missing description as Felipe pointed
out), but will again mean that the USB tree needs to take some Tegra
*.dts changes:-( I don't expect this will cause any conflicts, so it
probably won't require any cross-subsystem merge, but it'd be best to
apply all these Tegra changes in a separate topic branch just in case...

Felipe, let me know if you want me to actually do the patch application
for that topic branch to save you the hassle.
