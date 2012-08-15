From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/4] i2c: tegra: required clock support for controller
Date: Wed, 15 Aug 2012 10:58:04 -0600
Message-ID: <502BD51C.4010204@wwwdotorg.org>
References: <1344412294-2420-1-git-send-email-ldewangan@nvidia.com> <5022A89F.8070604@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5022A89F.8070604-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/08/2012 11:57 AM, Stephen Warren wrote:
> On 08/08/2012 01:51 AM, Laxman Dewangan wrote:
>> The Tegra's i2c controller required two clock sources for proper
>> operation named as div-clk and fast-clk.
>>
>> Adding support to make sure that driver will get these clocks and 
>> enable before any transfer and disable after transfer completed.
> 
> This works fine on Cardhu and Ventana for me. I'll apply it once I get
> an ack from Wolfram to take the I2C driver patch through the Tegra tree.

I haven't heard from Wolfram, but since the I2C driver patch is pretty
trivial, and pretty much has to go through the Tegra tree due to
dependencies on other Tegra patches, I went ahead and applied this
series to Tegra's for-3.7/clock branch.
