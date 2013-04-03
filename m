From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 5/9] ARM: tegra2: cpuidle: change driver initialization
Date: Wed, 03 Apr 2013 13:18:55 +0200
Message-ID: <515C101F.1020801@linaro.org>
References: <1364553095-25110-1-git-send-email-daniel.lezcano@linaro.org> <1364553095-25110-5-git-send-email-daniel.lezcano@linaro.org> <5155BB27.4000405@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <5155BB27.4000405@wwwdotorg.org>
Sender: linux-pm-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Joseph Lo <josephl@nvidia.com>
Cc: rjw@sisk.pl, linux-pm@vger.kernel.org, patches@linaro.org, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk, rnayak@ti.com, linux-tegra@vger.kernel.org, horms+renesas@verge.net.au, santosh.shilimkar@ti.com, arnd@arndb.de, lenb@kernel.org, nsekhar@ti.com
List-Id: linux-tegra@vger.kernel.org

On 03/29/2013 05:02 PM, Stephen Warren wrote:
> On 03/29/2013 04:31 AM, Daniel Lezcano wrote:
>> Initialize the idle states directly in the driver structure.
>>
>> That prevents extra structure declaration and memcpy at init time.
>=20
> Joseph, can you please review/ack patch 5/9 and patch 6/9. Thanks.

Thanks Joseph to review the patches.

Rafael is expecting an Acked-by.

If you are ok, with these patches, is it possible to ack them please ?

Thanks
  -- Daniel


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

