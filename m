Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0C53B6360;
	Mon, 12 Oct 2026 21:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841703; cv=none; b=Nb4UTKeViVxbZokcGa1V+Xsam4gHazo9NOhSHozDEXXL2d0CN5gy5QUTWCnlpEb1FxK0GqevKMcSPVfBIu2BudyOdNKXrbL0r7NNumbM1s8DMIIUTgsQ2iu22CVxgu205ahEyUbRlBjKSIPvj3ET2O0t6uzB7UDRrEzVVkd5TLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841703; c=relaxed/simple;
	bh=1BzDB2BTSbbVodXad2q5RCO9lRhGA9lDhMl+T93wIcA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aUXPhyb8FC/oZLvAn7otUHeQKBJ1a9RUk60CTHg0+zlOOF7npEUd4oBq1qvIyXKNv1fHNoTXGIM/maQNdKsfs9Bin19GlTFugjp1nmacj59FEp4/x29X5CBpOJKq5cLUqG7MNVchMKpikhWpWXwq1AEBW78hsevgqdEF7ElyFJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=he7gqmJQ; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="he7gqmJQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GnlUzR+Z74pHpjx6iyzt6t0OY2yTax8lLgnC5uVbk90=;
  b=he7gqmJQO32zM0F4dQtta0c77QPgzoikcAKmlwc+KkYvJQJMxKsLepU8
   2lWWAwFFDuN50pgIPZ6/N0uu7UYKeCC/pKgiz7a6nRtN5tN8PxqIZCUv4
   qISb0ZfvNUfrmNuThjLur1qfLsm/q+0wwew0vTjl/LC3g70dBOtEm2KGy
   o=;
X-CSE-ConnectionGUID: dTTSVntFS3OS6RxhQOSatA==
X-CSE-MsgGUID: 8hJTNnKETceAo+HaZe9S3w==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,154,1787004000"; 
   d="scan'208";a="299829059"
Received: from unknown (HELO hadrien) ([12.202.65.58])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 23:48:14 +0200
Date: Mon, 12 Oct 2026 17:48:11 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Jeremy Clifton <deaner92@yahoo.com>
cc: Marc Dietrich <marvin24@gmx.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ac100@lists.launchpad.net, 
    linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: nvec: use guard(mutex) in nvec_write_sync()
In-Reply-To: <492e9a13-b50b-48cb-bd41-3114573c7950@yahoo.com>
Message-ID: <525671bb-35b-32fc-94a6-e4e066fc1966@inria.fr>
References: <20261012171312.5998-1-deaner92.ref@yahoo.com> <20261012171312.5998-1-deaner92@yahoo.com> <b51c3755-a967-3de3-5f8c-3e4984d6e93c@inria.fr> <492e9a13-b50b-48cb-bd41-3114573c7950@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 12 Oct 2026, Jeremy Clifton wrote:

> Thank you so much for your guidance and feedback.
>
> It is the result that the patch will produce. All the unlock calls will
> be deleted and the out of memory path will have no braces, as per
> the style guidelines.
>
> The motivation behind the patch is to defer usage of manual locks
> for new and improved guards, disallowing lock leaks.
>
> This way, there can be no error producing path by not calling unlock.
>
> Shall I send a v2 with motivation included?

Please adjust the second sentence to be clear that it is referring to the
result, not the initial state.  If you would like to add something about
the motivation, that would probably be good too.

thanks,
julia

>
> On 10/12/26 2:45 PM, Julia Lawall wrote:
> > Is this the motivation for
> > doing the patch or the result of the patch.
>
>
