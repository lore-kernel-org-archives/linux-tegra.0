From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 00/26] ARM: provide common arch init for DT clocks
Date: Wed, 18 Sep 2013 14:45:41 -0600
Message-ID: <523A10F5.7090009@wwwdotorg.org>
References: <1379526839-14798-1-git-send-email-sebastian.hesselbarth@gmail.com> <20130918194711.GR19937@titan.lakedaemon.net> <523A046E.6040804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <523A046E.6040804@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Jason Cooper <jason@lakedaemon.net>, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, kernel@stlinux.com, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, STEricsson <STEricsson_nomadik_linux@list.st.com>, linux-rpi-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 09/18/2013 01:52 PM, Sebastian Hesselbarth wrote:
> On 09/18/2013 09:47 PM, Jason Cooper wrote:
>> On Wed, Sep 18, 2013 at 07:53:33PM +0200, Sebastian Hesselbarth wrote:
>> ...
>>> Sebastian Hesselbarth (26):
>>>    ARM: nomadik: move mtu setup to clocksource init
...
>>
>> How would you like to handle this series?
> 
> Jason,
> 
> honestly I don't really know, yet. I was hoping for Arnd and Olof
> decide on that. Maybe they also create a topic branch up to where
> arch-wide of_clk_init is introduced. Then each removal patch can
> go through the independent sub-trees. There may be more machs
> introduced before, that can then also depend on the common branch.

Oh, I was assuming you'd just take the whole thing through one tree,
likely in arm-soc. That's why I created the topic branch for the Tegra
PMIC patch that's a dependency of this... However, I guess if you just
merge the core into a topic branch in arm-soc and everyone merges it
back, that's fine. I assume the Tegra topic branch I created won't be
necessary in that case.
