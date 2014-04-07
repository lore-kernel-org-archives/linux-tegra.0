From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2] gpu: host1x: handle the correct # of syncpt regs
Date: Mon, 07 Apr 2014 09:39:09 -0600
Message-ID: <5342C69D.7040405@wwwdotorg.org>
References: <1396650665-6992-1-git-send-email-swarren@wwwdotorg.org>
 <20140407081838.GB25718@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140407081838.GB25718@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom@nvidia.com>, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

On 04/07/2014 02:18 AM, Thierry Reding wrote:
> On Fri, Apr 04, 2014 at 04:31:05PM -0600, Stephen Warren wrote:
>> From: Stephen Warren <swarren@nvidia.com>
>>
>> BIT_WORD() truncates rather than rounds, so the loops in
>> syncpt_thresh_isr() and _host1x_intr_disable_all_syncpt_intrs() use <=
>> rather than < in an attempt to process the correct number of registers
>> when rounding of the conversion of count of bits to count of words is
>> necessary. However, when rounding isn't necessary because the value is
>> already a multiple of the divisor (as is the case for all values of
>> nb_pts the code actually sees), this causes one too many registers to
>> be processed.
>>
>> Solve this by using and explicit DIV_ROUND_UP() call, rather than
>> BIT_WORD(), and comparing with < rather than <=.
>>
>> Signed-off-by: Stephen Warren <swarren@nvidia.com>
>> ---
>> v2: Use DIV_ROUND_UP rather than BITS_TO_LONGS to avoid problems on 64-bit.
>> ---
>>  drivers/gpu/host1x/hw/intr_hw.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> If I understand correctly there's no immediate need for this to go to
> stable kernels, nor for it to be queued for 3.15, right? That is the
> potential extra write isn't causing any harm on actual hardware, is it?
> 
> In that case I'll queue this up for 3.16.

We should definitely apply this, and as far back as the code exists,
since the SW is touching non-existent registers, and that is presumably
undefined behaviour, which could potentially cause hard-to-diagnose bugs.

Besides, I want the mainline kernel to run on our simulator without
having to maintain patches for fixed issues.
