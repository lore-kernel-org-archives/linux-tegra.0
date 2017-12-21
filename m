From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 3/4] clk: tegra: MBIST work around for Tegra210
Date: Thu, 21 Dec 2017 11:08:48 +0000
Message-ID: <c320b903-31a0-bf8e-2d78-2296e78d31a2@nvidia.com>
References: <1510842542-16451-1-git-send-email-pdeschrijver@nvidia.com>
 <1510842542-16451-4-git-send-email-pdeschrijver@nvidia.com>
 <3d7f4e84-af44-ba3d-7910-a51a0abce136@nvidia.com>
 <20171221094049.GX29417@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171221094049.GX29417-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 21/12/17 09:40, Peter De Schrijver wrote:
> On Wed, Dec 20, 2017 at 10:03:35AM +0000, Jon Hunter wrote:
>>
>> On 16/11/17 14:29, Peter De Schrijver wrote:
>>> Tegra210 has a hw bug which can cause IP blocks to lock up when ungating a
>>> domain. The reason is that the logic responsible for resetting the memory
>>> built-in self test mode can come up in an undefined state because it doesn't
>>> get a clock or reset signal. Work around this by making sure the logic will
>>> get some clock edges by ensuring the relevant clock is enabled and temporarily
>>> override the relevant second level clock gates (SLCG).
>>
>> Not sure I follow the 2nd half of the above sentence.
> 
> The logic responsible for resetting the MBIST mode is not clocked during
> module reset because the module SLCGs are gated while they shouldn't be.
> 
> Does this make it more clear? :)
Yes thanks!

Jon

-- 
nvpublic
