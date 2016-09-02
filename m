From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH] phy: mark tegra_xusb_lane_lookup_function() static
Date: Fri, 2 Sep 2016 17:45:32 +0530
Message-ID: <57C96D64.9050600@ti.com>
References: <1472634319-11886-1-git-send-email-baoyou.xie@linaro.org>
 <7060924.RuInUXIHDe@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7060924.RuInUXIHDe@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Baoyou Xie <baoyou.xie@linaro.org>
Cc: swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, xie.baoyou@zte.com.cn
List-Id: linux-tegra@vger.kernel.org

Hi,

On Wednesday 31 August 2016 03:31 PM, Arnd Bergmann wrote:
> On Wednesday, August 31, 2016 5:05:19 PM CEST Baoyou Xie wrote:
>> We get 1 warning when building kernel with W=1:
>> drivers/phy/tegra/xusb.c:104:5: warning: no previous prototype for 'tegra_xusb_lane_lookup_function' [-Wmissing-prototypes]
>>
>> In fact, this function is only used in the file in which it is
>> declared and don't need a declaration, but can be made static.
>> So this patch marks it 'static'.
>>
>> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
>>
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> Same comment as for the other patch, it's better to use "phy: tegra: ..."
> in the subject for clarity.

Fixed it myself and merged this and the other patch.

Thanks
Kishon
