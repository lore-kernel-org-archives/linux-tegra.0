From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Conflicts between Tegra PWM tree and common clock patches
Date: Mon, 02 Jul 2012 11:35:04 -0600
Message-ID: <4FF1DBC8.2000406@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry,

The following commits in your PWM tree conflict with some Tegra clock
driver re-structuring that's part of the common clock conversion on Tegra.

df6da47 ARM: tegra: Provide clock for only one PWM controller
65e7385 ARM: tegra: Fix PWM clock programming

To alleviate this, could we either:

a) Remove those two commits from your tree and into the Tegra tree. I
think this won't cause any runtime issues, since Tegra PWM is a feature
we aren't using yet, so it's OK if the branch it's made to work in is
not the PWM branch.

b) If your branch is stable, I can merge it into the Tegra tree in order
to resolve the conflicts there. However, for this to work, you need to
100% guarantee that the branch won't be rebased between now and when you
send Linus a pull request for 3.6.

Note that I'm out on Wednesday this week for 4th July holiday, and then
leaving on vacation for 2 weeks on July 8th, so we need to resolve this
quickly if we are to merge the Tegra common clock conversion before I
leave. Also, once we do (a) or (b) above, Prashant needs to rebase his
patches on the result, and he's in India, so there's a big time-zone
delay there too.

Sorry, when I ack'd the Tegra clock patches for the PWM tree, I don't
believe the common clock conversion was on the horizon.

Thanks!
