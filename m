From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH 2/8] clk: tegra: host1x has fractional divider
Date: Mon, 23 Jul 2018 10:32:58 +0100
Message-ID: <7df28a76490315402d28ad7de43dc0db@codethink.co.uk>
References: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
 <20180720134532.13148-3-ben.dooks@codethink.co.uk>
 <20180723085010.GK1636@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723085010.GK1636@tbergstrom-lnx.Nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, pgaikwad@nvidia.com, jonathanh@nvidia.co, thierry.reding@gmail.com, linux-kernel@lists.codethink.co.uk
List-Id: linux-tegra@vger.kernel.org



On 2018-07-23 09:50, Peter De Schrijver wrote:
> On Fri, Jul 20, 2018 at 02:45:26PM +0100, Ben Dooks wrote:
>> The host1x clock according to both tegra2 and tegra3 manuals is
>> an 8bit divider with lsb being fractional. This is running into
>> an issue where the host1x is being set on a tegra20a system to
>> 266.4MHz but ends up at 222MHz instead.
>> 
> 
> The fact the hw has a fractional divider, does not mean we're allowed 
> to use
> it. Due to the non 50% duty cycle of fractional divided clocks, they 
> are not
> allowed for certain peripherals. Do you have information indicating 
> this is
> ok for the host1x clock?

Only that's what was setup for the systems we're using.
We couldn't match the 2.6 working system without these changes.

-- 
Ben
