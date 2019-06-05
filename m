From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] clk: tegra210: Fix default rates for HDA clocks
Date: Wed, 5 Jun 2019 12:30:31 +0100
Message-ID: <f2757c84-363c-cef0-db9d-c4e4423200b5@nvidia.com>
References: <1559121501-8566-1-git-send-email-jonathanh@nvidia.com>
 <20190529134625.GD17223@ulmo>
 <5f2b8f8d-f3e5-fab8-8cf0-fa8a3e917845@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5f2b8f8d-f3e5-fab8-8cf0-fa8a3e917845@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


On 31/05/2019 15:58, Jon Hunter wrote:
> 
> On 29/05/2019 14:46, Thierry Reding wrote:
>> On Wed, May 29, 2019 at 10:18:21AM +0100, Jon Hunter wrote:
>>> Currently the default clock rates for the HDA and HDA2CODEC_2X clocks
>>> are both 19.2MHz. However, the default rates for these clocks should
>>> actually be 51MHz and 48MHz, respectively. Correct the default clock
>>> rates for these clocks by specifying them in the clock init table for
>>> Tegra210.
>>>
>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>> ---
>>>  drivers/clk/tegra/clk-tegra210.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>
>> Does this fix anything? Should this be backported to stable releases?
> 
> Good point. We are aligning the clock configuration with what we ship.
> So I thought for completeness it would be good to test HDA playback
> across the various sample-rates we support (32kHz to 192kHz) but with or
> without this patch I am not hearing anything. Let me check on this with
> Sameer as I would like to see if we need to mark this for stable or not.
> 
>> Acked-by: Thierry Reding <treding@nvidia.com>

I have confirmed that this does fix HDA playback on Tegra210. Without
this fix, I am seeing the following messages during playback and
playback is distorted ...

Write error: -32,Broken pipe
[   15.069335] tegra-mc 70019000.memory-controller: hdar: read
@0x0000000000000000: EMEM address decode error (EMEM decode error)
Write error: -32,Broken pipe
[   15.465362] tegra-mc 70019000.memory-controller: hdar: read
@0x0000000000000000: EMEM address decode error (EMEM decode error)
Write error: -32,Broken pipe
[   15.858615] tegra-mc 70019000.memory-controller: hdar: read
@0x0000000000000000: EMEM address decode error (EMEM decode error)
W

Do you want me to update the change and resend?

Jon

-- 
nvpublic
