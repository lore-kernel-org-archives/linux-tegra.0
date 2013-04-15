From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: cpuidle: Remove unused variables
Date: Mon, 15 Apr 2013 10:55:43 +0200
Message-ID: <516BC08F.6030405@linaro.org>
References: <1366011121-7858-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1366011121-7858-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/15/2013 09:32 AM, Thierry Reding wrote:
> Commit 0697598 ("ARM: tegra: cpuidle: remove useless initialization")
> removes the last usage of the drv variable from the Tegra20, Tegra30 =
and
> Tegra114 cpuidle drivers but forgot to remove the variable.
>=20
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> ---

Hi Thierry,

thanks for the cleanup. Actually, that has been already fixed by the
patches:

http://www.spinics.net/lists/arm-kernel/msg237945.html
* [V3 patch 15/19] ARM: tegra: cpuidle: use init/exit common routine fo=
r
tegra3
 http://www.spinics.net/lists/arm-kernel/msg237945.html

* [V3 patch 11/19] ARM: tegra: cpuidle: use init/exit common routine
  http://www.spinics.net/lists/arm-kernel/msg237956.html

* [V3 patch 14/19] ARM: tegra: cpuidle: use init/exit common routine fo=
r
tegra2
  http://www.spinics.net/lists/arm-kernel/msg237965.html

Regards
  -- Daniel

--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
