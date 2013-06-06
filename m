From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] ARM: tegra: add basic SecureOS support
Date: Thu, 06 Jun 2013 10:28:32 -0600
Message-ID: <51B0B8B0.3050503@wwwdotorg.org>
References: <1370503687-17767-1-git-send-email-acourbot@nvidia.com> <1740292.8Sz57ytBcM@flatron> <51B0667D.30801@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51B0667D.30801@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Courbot <acourbot@nvidia.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Joseph Lo <josephl@nvidia.com>, Karan Jhavar <kjhavar@nvidia.com>, Varun Wadekar <vwadekar@nvidia.com>, Chris Johnson <CJohnson@nvidia.com>, Matthew Longnecker <MLongnecker@nvidia.com>, "gnurou@gmail.com" <gnurou@gmail.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 06/06/2013 04:37 AM, Alex Courbot wrote:
> Hi Tomasz,
> 
> On 06/06/2013 07:17 PM, Tomasz Figa wrote:
...
>> I think this patch could be split into several patches:
>>   - add support for firmware
>>   - split reset function
>>   - add reset support using firmware.
> 
> Mmm possibly yes, but I wonder if that would not be too much splitting.
> Stephen?

That's probably fine. It might make bisection easier if there are
regressions.
