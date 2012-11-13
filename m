From: Mark Zhang <markz@nvidia.com>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra20 host1x support
Date: Tue, 13 Nov 2012 16:29:49 +0800
Message-ID: <50A204FD.9030602@nvidia.com>
References: <1352467202-27903-1-git-send-email-thierry.reding@avionic-design.de> <1352467202-27903-2-git-send-email-thierry.reding@avionic-design.de> <50A1FA7C.4010507@nvidia.com> <20121113075247.GB8409@avionic-0098.mockup.avionic-design.de> <50A1FE2F.8000107@nvidia.com> <20121113080456.GB15983@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121113080456.GB15983@avionic-0098.mockup.avionic-design.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Stephen Warren <swarren@wwwdotorg.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 11/13/2012 04:04 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Tue, Nov 13, 2012 at 04:00:47PM +0800, Mark Zhang wrote:
>> On 11/13/2012 03:52 PM, Thierry Reding wrote:
>>>> Old Signed by an unknown key
>>>
>>> On Tue, Nov 13, 2012 at 03:45:00PM +0800, Mark Zhang wrote:
>>>> On 11/09/2012 09:20 PM, Thierry Reding wrote:
>>>>> @@ -116,6 +122,9 @@ static __initdata struct tegra_clk_init_table tegra_dt_clk_init_table[] = {
>>>>>         { "sbc2",       "pll_p",        100000000,      false },
>>>>>         { "sbc3",       "pll_p",        100000000,      false },
>>>>>         { "sbc4",       "pll_p",        100000000,      false },
>>>>> +       { "host1x",     "pll_c",        144000000,      false },
>>>>> +       { "disp1",      "pll_p",        600000000,      false },
>>>>> +       { "disp2",      "pll_p",        600000000,      false },
>>>>
>>>> I think here the parent of disp2 should be "pll_d_out0", not "pll_p".
>>>> Right now pll_p has not a proper clock setting to make 148.5MHz 1080p
>>>> HDMI happy. In addition, you add the 297MHz in pll_d frequency table
>>>> next and I think this is for disp2 has a proper clock rate to support HDMI.
>>> [...]
>>>>> @@ -1051,6 +1053,9 @@ static struct clk_duplicate tegra_clk_duplicates[] = {
>>>>>         CLK_DUPLICATE("pll_p_out3", "tegra-i2c.1", "fast-clk"),
>>>>>         CLK_DUPLICATE("pll_p_out3", "tegra-i2c.2", "fast-clk"),
>>>>>         CLK_DUPLICATE("pll_p_out3", "tegra-i2c.3", "fast-clk"),
>>>>> +       CLK_DUPLICATE("pll_p", "tegra-dc.0", "parent"),
>>>>> +       CLK_DUPLICATE("pll_p", "tegra-dc.1", "parent"),
>>>>> +       CLK_DUPLICATE("pll_d_out0", "tegra-hdmi", "parent"),
>>>>>  };
>>>>
>>>> The same with my above comments, the tegra-dc.1's parent should be
>>>> pll_d_out0.
>>>
>>> The way this works is that for HDMI it is required that the DC and HDMI
>>> blocks have the same parent. So what really happens is that once you
>>> setup one of the DCs to work with HDMI, its clock will automatically be
>>> reparented to the HDMI parent clock, which in this case is "pll_d_out0".
>>>
>>
>> Are you sure about this? Is this a hardware feature? I know the dc and
>> hdmi controller should have the same clock parent but I think this
>> should be ensured by device driver...
> 
> It's implemented in tegra_output_hdmi_setup_clock().
> 

I see. Okay, thanks a lot.

> Thierry
> 
> * Unknown Key
> * 0x7F3EB3A1
> 
