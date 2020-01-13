From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 0/8] NVIDIA Tegra I2C driver fixes and improvements
Date: Tue, 14 Jan 2020 02:01:56 +0300
Message-ID: <15860a85-39ee-3bb9-168c-c5a981ff3720@gmail.com>
References: <20200112171430.27219-1-digetx@gmail.com>
 <20200113215341.GA2689@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <20200113215341.GA2689@ninjato>
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

14.01.2020 00:53, Wolfram Sang пишет:
> On Sun, Jan 12, 2020 at 08:14:22PM +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> This patchset adds support for atomic transfers which are required for
>> shutting down machine properly. Secondly, a (not)suspending I2C and some
>> other things are fixed/improved by this small series as well. Please review
>> and apply, thanks in advance!
>>
>> Changelog:
>>
>> v4: Removed the "clk: tegra: Fix double-free in tegra_clk_init()" patch
>>     from this series, which was added by accident in v3.
>>
>>     Added Thierry's tested-by to the patches.
> 
> Looks good to me. I think all these patches should go to v5.6, let me
> know if patches 1 and/or 2 should go to v5.5?
> 

Patches 1 and 2 should go into v5.5, thanks.
