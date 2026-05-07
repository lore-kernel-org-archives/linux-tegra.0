Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709D430BBB8;
	Thu,  7 May 2026 11:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154292; cv=none; b=P43FxJrVflcThmA7KKEtxGJ68Vkm4fyEETG7y6Fqs1MMg8kEomTd9eGGBuuWqC8Wx2YVackg14LPZEw0rgRIOTHzSn0k3t4/H10l3enomW3rqIIbEgrxd4xmc0qM+toqE2CONE+GrafeHAt5RheAG0OwXbTwZtw6LcGCy4q3nxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154292; c=relaxed/simple;
	bh=jTnvtAFFnsIrZicTBdhLaws8Zfm6vt3oXsIQRVkiHjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGsHMlVaQuVbSOI3+o7IrZueoeaKnZ0YwaHyuXcPjF1OGVteX56TrTGu6LUlMu4yt0ZmLBKPPJSO6UUixmJsowyWg7db9duXiQ5cQkjfHKFAP33qtLKpyBiqG5JJ4SsP7uSxfoXd6f5pJz7HTqS2DBnLybnUAnWTED2uqQPC4uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbetJZh8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbetJZh8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E29C2BCB2;
	Thu,  7 May 2026 11:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778154292;
	bh=jTnvtAFFnsIrZicTBdhLaws8Zfm6vt3oXsIQRVkiHjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fbetJZh8QF+19DK4P580Sxu0oRB/09PJQOlcMHn8yyDPCoG2QK7qzxj6qV8RHiaP/
	 8Jh1hwR8ddK4Gy8xrvgmGRDkd/pBhlQHWyqjMk4CmheIF3vUExWYtjR9oFutartqN/
	 b63MJna/F5vBVlfJ/9eDiOCXeY0J3A3YpFQN3FTBVX4C78iXTM0e4aae5JaOoawMQs
	 1bpw+Ma9I4/Y/4TXrfZ221UwWUgXFtGe5yHcvQZU62NwM0Ktpl0YtGad/igd5dDRq/
	 r9F2hDmTP/zlbaZ0zAncsPw2WUwNyGJdtdTZfawdvjUyeWBPWrybYGOZuzNhU9yoSr
	 NgHdL7gms42nw==
Date: Thu, 7 May 2026 17:14:39 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, mark.rutland@arm.com, lpieralisi@kernel.org, 
	bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] firmware: psci: Set pm_set_resume/suspend_via_firmware()
 for SYSTEM_SUSPEND
Message-ID: <i5gyutgzfckobfaidbwtlzpgjsdcarbg3mroqhvfy6eha7pvax@egxycr4kp7xw>
References: <20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com>
 <acrdFfk8al80dynq@baldur>
 <ces6pczk5yo2v5h6sga2dl2xuncqv4pmudunc7dhyeiy6swfh7@bk7vxdxrsrzz>
 <adO1lS2g8Hewj0Ol@baldur>
 <a6lce6bq3yjzidxzq6w2xuiyevvgfuu5crbijtzeiukecmwvhh@k2w64iyj7q7q>
 <cbffc0ec-2961-4a3f-91e8-770f3f7f8bcc@nvidia.com>
 <4ympdtnpqrydnjmapuswsnig7ymuopy4kpxqclyxnoaqgpdmxl@eywcfbu3avtg>
 <49a68039-3a59-4b4c-acbd-0fa917d0e456@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49a68039-3a59-4b4c-acbd-0fa917d0e456@nvidia.com>

On Thu, May 07, 2026 at 11:54:08AM +0100, Jon Hunter wrote:
> 
> On 06/05/2026 18:18, Manivannan Sadhasivam wrote:
> > On Tue, May 05, 2026 at 02:47:08PM +0100, Jon Hunter wrote:
> > > Hi Mani,
> > > 
> > > On 06/04/2026 15:29, Manivannan Sadhasivam wrote:
> > > 
> > > ...
> > > 
> > > > Sure. It makes logical sense to relate this API behavior with the state of CX.
> > > > I'll send v2 with the updated commit message.
> > > 
> > > Did you ever send a V2? I am not sure if I missed it and so wanted to check.
> > > 
> > 
> > No, I didn't. I had some offline discussions with Bjorn and concluded that it
> > might not be appropriate to set pm_set_resume/suspend_via_firmware() for all
> > firmware flavors that our Qcom SoCs support.
> > 
> > Then I found out a limitation with our Root Complex IPs in exiting L1ss if the
> > platform is suspended. So sent out a series to fix that and that allowed me to
> > get past the NVMe issue coincidentally.
> > 
> > But since this patch applies to other ARM64 SoCs, it logically makes sense to
> > apply it IMO. So, I'll leave it to PSCI maintainers to decide.
> 
> 
> I am not sure I follow the above. Sounds like you don't want to apply this
> because it may not work for all Qualcomm SoCs, but regardless of that you
> will leave to the PSCI maintainers to decide?
> 

No, I was saying that there is no need to respin this patch and the PSCI
maintainers can apply this patch as-is.

> Anyway, I have resumed the discussion on the original thread [0] because
> this has been broken now for the last two kernel releases.
> 

Sure. We were carrying out-of-tree patch to fix this issue ever since we started
supporting NVMe on Qcom SoCs ;)

- Mani

-- 
மணிவண்ணன் சதாசிவம்
