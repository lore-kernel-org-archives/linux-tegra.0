From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: defconfig updates
Date: Thu, 16 Aug 2012 10:51:29 -0600
Message-ID: <502D2511.50008@wwwdotorg.org>
References: <1345052375-13374-1-git-send-email-swarren@wwwdotorg.org> <11057342.IZzS6D55yK@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <11057342.IZzS6D55yK@fb07-iapwap2>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/16/2012 02:06 AM, Marc Dietrich wrote:
...
> any reason why Wifi is not enabled yet?

No specific reason; just nobody sent a patch to do it. Feel free to do
so for any feature that works.

We'd have to be careful not to enable SDIO-based WiFi yet, since that
causes instability issues on boards that contain it. However, looking at
Wei's patches for that, simply enabling the config options is not going
to cause any issues; it would need board .dts changes to actually
instantiate the driver.
