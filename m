From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v7 3/5] misc: fuse: Add efuse driver for Tegra
Date: Wed, 11 Jun 2014 09:58:28 -0600
Message-ID: <53987CA4.4040506@wwwdotorg.org>
References: <1401973754-19701-1-git-send-email-pdeschrijver@nvidia.com> <1401973754-19701-4-git-send-email-pdeschrijver@nvidia.com> <53984FE3.6010509@nvidia.com> <20140611152551.GH5961@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140611152551.GH5961@tbergstrom-lnx.Nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>
Cc: Russell King <linux@arm.linux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 06/11/2014 09:25 AM, Peter De Schrijver wrote:
> On Wed, Jun 11, 2014 at 02:47:31PM +0200, Mikko Perttunen wrote:
>> On 05/06/14 16:09, Peter De Schrijver wrote:
>> ...
>>> +int tegra_fuse_readl(u32 offset, u32 *val)
>>> +{
>>> +       if (!fuse_readl)
>>> +               return -ENXIO;
>>> +
>>> +       *val = fuse_readl(offset);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>
>> -EPROBE_DEFER would be a better error value, so that drivers can work 
> 
> Ok.
> 
>> even if they are initially probed before the fuse driver. Of course, if 
>> the fuse initialization is moved into machine init then this is a non-issue.
> 
> The exported function will always be initialized later because on Tegra20 it
> requires APB DMA to be available. If you read the fuses directly, the system
> sometimes hangs.

That's not true in the current code. IIRC, the bug was that *if* an APB
DMA access to anything and a CPU access to the fuses happen at the same
time, then there can be a hang. As such, the current fuse code accesses
the fuses directly (without potential for a hang) if the APB DMA driver
is not available, but once the driver becomes available, it reads the
fuses through DMA instead. Does the new code not do that?
