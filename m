From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] clk: tegra: use pll_ref as the pll_e parent
Date: Thu, 31 Oct 2013 10:41:23 -0600
Message-ID: <52728833.2030709@wwwdotorg.org>
References: <1383093707-10312-1-git-send-email-pdeschrijver@nvidia.com> <527128B5.2020101@wwwdotorg.org> <20131030221833.GQ22111@tbergstrom-lnx.Nvidia.com> <52718D1B.6030106@wwwdotorg.org> <20131031154142.GX22111@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131031154142.GX22111@tbergstrom-lnx.Nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, Mark Zhang <markz@nvidia.com>, Thierry Reding <treding@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 10/31/2013 09:41 AM, Peter De Schrijver wrote:
> On Wed, Oct 30, 2013 at 11:50:03PM +0100, Stephen Warren wrote:
>> On 10/30/2013 04:18 PM, Peter De Schrijver wrote:
>>> On Wed, Oct 30, 2013 at 04:41:41PM +0100, Stephen Warren wrote:
>>>> On 10/29/2013 06:41 PM, Peter De Schrijver wrote:
>>>>> Use pll_ref instead of pll_re_vco as the pll_e parent on Tegra114 and
>>>>> Tegra124. Also add a pll_ref table entry for pll_e for Tegra114.
>>>>
>>>> Why? What benefit does this give, or what bug does this fix?
>>>
>>> Otherrwise Tegra114 will crash on boot.
>>
>> Sigh. For what reason?
> 
> pll_re_vco having an unsupported rate of 300Mhz. My guess is that it depends
> on the bootloader if you will see this. I'm fairly sure I verified this on
> my dalmore in helsinki and it worked, but it failed on Paul's test setup.

OK, so this is primarily a SW issue, because pll_e's freq_table simply
doesn't have an entry for input frequency 300MHz. Can you make sure the
commit description explains that?
