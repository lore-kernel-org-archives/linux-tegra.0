From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 07/26] iommu/dma: move the arm64 wrappers to common code
Date: Tue, 4 Jun 2019 12:35:05 +0100
Message-ID: <5e119919-bbfd-14a4-0258-93e8249d11c4@nvidia.com>
References: <20190422175942.18788-1-hch@lst.de>
	<20190422175942.18788-8-hch@lst.de>
	<06b331f0-7df7-a6cd-954c-789f89a0836d@arm.com>
	<acb46c7f-0855-de30-485f-a6242968f947@nvidia.com>
	<20190604060554.GA14536@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20190604060554.GA14536-jcswGhMUV9g@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Cc: Tom Lendacky <thomas.lendacky-5C7GfCeVMHo@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 04/06/2019 07:05, Christoph Hellwig wrote:
> On Mon, Jun 03, 2019 at 08:47:57PM +0100, Jon Hunter wrote:
>> Since next-20190529 one of our tests for MMC has started failing, where
>> the symptom is that the data written to the MMC does not match the
>> source. Bisecting this is pointing to this commit. Unfortunately, I am
>> not able to cleanly revert this on top of -next, but wanted to report
>> this if case you have any ideas.
> 
> Does this fix your problem?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git/commit/?h=generic-dma-ops&id=1b961423158caaae49d3900b7c9c37477bbfa9b3

Yes I can confirm with this patch on today's -next the issue is no
longer seen, and reverting this patch on top of today's -next causes the
problem to occur again. So yes this fixes my problem.

Thanks!
Jon

-- 
nvpublic
