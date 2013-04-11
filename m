From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH] mfd: tps65090: Add compatible string for charger subnode
Date: Thu, 11 Apr 2013 11:34:44 -0400
Message-ID: <5166D814.30400@nvidia.com>
References: <1365614095-5846-1-git-send-email-rklein@nvidia.com> <20130410221721.GM4874@zurbaran>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130410221721.GM4874@zurbaran>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 4/10/2013 6:17 PM, Samuel Ortiz wrote:
> Hi Rhyland,
> 
> On Wed, Apr 10, 2013 at 01:14:55PM -0400, Rhyland Klein wrote:
>> This patch adds the of_compatible value for the tps65090 charger
>> subnode used when loading the driver to find its properties
>> and of_node.
>>
>> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
>> ---
>>  drivers/mfd/tps65090.c |    1 +
>>  1 file changed, 1 insertion(+)
> Applied, thanks. And sorry for taking the wrong version.
> 
> Cheers,
> Samuel.
> 
Np, Thanks!

-rhyland

-- 
nvpublic
