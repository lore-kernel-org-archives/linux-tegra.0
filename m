From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] i2c: tegra: Make timeout error more informative
Date: Tue, 10 Mar 2020 16:26:41 +0300
Message-ID: <017aad72-9872-a4aa-dc99-bd7d08c0db14@gmail.com>
References: <20200302173512.2743-1-digetx@gmail.com>
 <20200310113706.GW1987@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200310113706.GW1987@ninjato>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

10.03.2020 14:37, Wolfram Sang пишет:
> On Mon, Mar 02, 2020 at 08:35:12PM +0300, Dmitry Osipenko wrote:
>> The I2C timeout error message doesn't tell us what exactly failed and some
>> I2C client drivers do not clarify the error either. Adding WARN_ON_ONCE()
>> results in a stacktrace being dumped into KMSG, which is very useful for
>> debugging purposes.
> 
> This is good for debugging, in deed, yet not good in the generic case.
> Timeouts are not an exception on the I2C bus (think of an EEPROM which
> is busy during an erase cycle), so it shouldn't be printed at all.
> 
> This prinout should rather be dropped or at least be dev_dbg.

Oh, well. I'll keep this debugging applied locally then, it's quite
unfortunate when something fails silently :)
