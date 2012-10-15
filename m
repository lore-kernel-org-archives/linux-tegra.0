From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] crypto: tegra: remove include of <mach/clk.h>
Date: Mon, 15 Oct 2012 11:39:17 -0600
Message-ID: <507C4A45.4050900@wwwdotorg.org>
References: <1349216260-917-1-git-send-email-swarren@wwwdotorg.org> <20121015143328.GC25426@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <20121015143328.GC25426@gondor.apana.org.au>
Sender: linux-crypto-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David Miller <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 10/15/2012 08:33 AM, Herbert Xu wrote:
> On Tue, Oct 02, 2012 at 04:17:40PM -0600, Stephen Warren wrote:
>> From: Stephen Warren <swarren@nvidia.com>
>>
>> Nothing from this file is used, and the file will hopefully be deleted
>> soon.
>>
>> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> 
> Acked-by: Herbert Xu <herbert@gondor.apana.org.au>

Thanks, applied to Tegra's for-3.8/cleanup.
