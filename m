From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH V3 4/4] soc/tegra: pmc: Use the new reset APIs to manage
 reset controllers
Date: Tue, 25 Apr 2017 09:45:48 +0530
Message-ID: <afcddcbe-7086-2739-6de2-84f5c1d34374@codeaurora.org>
References: <1492514488-27385-1-git-send-email-vivek.gautam@codeaurora.org>
 <1492514488-27385-5-git-send-email-vivek.gautam@codeaurora.org>
 <e87a846b-4bbf-03cf-f3a6-99d5e468425c@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <e87a846b-4bbf-03cf-f3a6-99d5e468425c@nvidia.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, p.zabel@pengutronix.de, swarren@wwwdotorg.org, balbi@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, thierry.reding@gmail.com, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org



On 04/24/2017 06:15 PM, Jon Hunter wrote:
> On 18/04/17 12:21, Vivek Gautam wrote:
>> Make use of reset_control_array_*() set of APIs to manage
>> an array of reset controllers available with the device.
> Before we apply this patch, I need to check to see if the order of the
> resets managed by the PMC driver matter. Today the order of the resets
> is determined by the order they appear in the DT node and although the
> new APIs work in the same way they do not guarantee this. So let me
> check to see if we can any concerns about ordering here. Otherwise would
> be nice to use these APIs.

Right, that will be perfect.

Best regards
Vivek

>
> Cheers
> Jon
>

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
