From: Bitan Biswas <bbiswas@nvidia.com>
Subject: Re: [PATCH V4] drivers: i2c: tegra: fix checkpatch defects
Date: Thu, 6 Jun 2019 11:22:45 -0700
Message-ID: <70a73e4b-c5d2-9c5d-7b18-f4325c6360b3@nvidia.com>
References: <1559806523-1352-1-git-send-email-bbiswas@nvidia.com>
 <20190606115705.6j2oigsm2imvvqh7@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190606115705.6j2oigsm2imvvqh7@ninjato>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org



On 6/6/19 4:57 AM, Wolfram Sang wrote:
> On Thu, Jun 06, 2019 at 12:35:23AM -0700, Bitan Biswas wrote:
>> Fix checkpatch.pl warning(s)/error(s)/check(s) in i2c-tegra.c
>>
>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>> as needed. Replace BUG() with error handling code.
>> Define I2C_ERR_UNEXPECTED_STATUS for error handling.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> 
> I wonder why you didn't fix this checkpatch defect?
> 
> WARNING: A patch subject line should describe the change not the tool that found it
> 
I ran checkpatch.pl on the source file only hence missed this warning. I 
shall fix this in updated patch.

-Thanks,
  Bitan
