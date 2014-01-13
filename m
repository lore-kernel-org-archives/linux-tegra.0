From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] pinctrl: tegra1x4: initialize at arch_initcall time
Date: Mon, 13 Jan 2014 10:03:40 -0700
Message-ID: <52D41C6C.9060500@wwwdotorg.org>
References: <1389401416-29892-1-git-send-email-abrestic@chromium.org> <20140113090223.GA16296@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140113090223.GA16296-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/13/2014 02:02 AM, Thierry Reding wrote:
> On Fri, Jan 10, 2014 at 04:50:16PM -0800, Andrew Bresticker wrote:
>> Many devices rely on pinctrl/pinmux settings being applied
>> before probing and some of these may probe before device_initcall
>> time (e.g. i2c at subsys_initcall).  Move Tegra1x4 pinctrl driver
>> registration to arch_initcall time so that proper pin settings
>> can be applied earlier.
>>
>> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>>  drivers/pinctrl/pinctrl-tegra114.c | 13 ++++++++++++-
>>  drivers/pinctrl/pinctrl-tegra124.c | 13 ++++++++++++-
>>  2 files changed, 24 insertions(+), 2 deletions(-)
> 
> I wonder if a better approach would be to add pin control and pin mux
> settings for devices that explicitly need them to the device tree nodes
> of the devices themselves.

We can't do that; the entire pinctrl state needs to be programmed at
once to avoid the conflict of multiple pins/groups being muxed to the
same function. However, we can make this work with empty states I believe.
