From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/5] firmware: tegra: Add support for in-band debug
Date: Tue, 14 Jul 2020 19:12:16 +0100
Message-ID: <ff404043-3696-121d-52af-dbea4e1005d4@nvidia.com>
References: <20200712100118.13343-1-jonathanh@nvidia.com>
 <20200714161809.GE251696@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200714161809.GE251696@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 14/07/2020 17:18, Thierry Reding wrote:
> On Sun, Jul 12, 2020 at 11:01:13AM +0100, Jon Hunter wrote:
>> This series adds support for in-band debug messaging for the BPMP and
>> updates the BPMP ABI to align with the latest version.
>>
>> Jon Hunter (4):
>>   firmware: tegra: Use consistent return variable name
>>   firmware: tegra: Prepare for supporting in-band debugfs
>>   firmware: tegra: Add support for in-band debug
>>   firmware: tegra: Update BPMP ABI
>>
>> Timo Alho (1):
>>   firmware: tegra: add return code checks and increase debugfs size
>>
>>  drivers/firmware/tegra/bpmp-debugfs.c | 436 ++++++++++--
>>  drivers/firmware/tegra/bpmp.c         |   6 +-
>>  include/soc/tegra/bpmp-abi.h          | 913 ++++++++++++++++++--------
>>  3 files changed, 1038 insertions(+), 317 deletions(-)
> 
> All applied, thanks. I had to tweak a couple of things to make
> checkpatch happy, though. checkpatch also wasn't happy with the ABI
> header update, but I left it as-is to make it easier to update in the
> future.

Thanks. Yes I noticed that as well with the ABI update. I wonder if we
should get them to fix that.

Jon

-- 
nvpublic
