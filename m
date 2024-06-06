Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8363BBCC;
	Thu,  6 Jun 2024 17:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717696010; cv=none; b=ljBzbMEd8eyIfsrVU9fhp5Lru/DydSyEjKrWCvLNxBqlC8t4nf1XwyR1VdRWfjHyz/0avyP25IfdQuHRXuOR5DkngyqD49qge6VXBdecJT3ypVajI+gFURMrq35ATnrqHNG1S0DazPhSwMlHR0dpRyQJkVnDKTgVjYVDDpteFsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717696010; c=relaxed/simple;
	bh=yj4QlAnmpy3/zzmkJO45lntk4a+/9Qa0Fts2/S6ue5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sm7XjXe8K2Dk0ANdEvWuusriEf/6plO3SFBVyqt53RRoH/OBOWrzORmqOLll1DRyDFIfoHeADWi+DLeAznOOpVL74M0s5YYwTHze+VScBp3QEVBALNBLST0evfxNQy+uIp4kl0Nrd6Rfe5Bkpv+Y2EBa6SrdvteuGUsgxeHmkig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QnPdgSbO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QnPdgSbO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8489C2BD10;
	Thu,  6 Jun 2024 17:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717696009;
	bh=yj4QlAnmpy3/zzmkJO45lntk4a+/9Qa0Fts2/S6ue5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QnPdgSbObPZKtSyaZzihxtKuf6OGzSKv9YL+u0liwgOYh7CdWJDEtzv6U9lJ+U2aa
	 kBsnJIyJGyKj0lUQcSSHbceG4dTnzqWEMWgVmhfZR7tB9u/NFnyz+Siiwh5OJAx0+E
	 0vo8d8S4dtBNI94qvAaUcFDBE4DrmGHpRcKfhwc/2QOY9c+CNp6nruNqG5UO3O4eDa
	 zJu4OKl7kSX0g0J7v4Hc8g5RiWtOUQTLc4XncDySxlTGllY1DK4jzSEFaPuYc80tuw
	 tH/bYeGJQoH/NvbnELK7tJglzK41dQdRUmExTEHYpssiOgzDsRgvuCW+nQJ9yTnLfI
	 0VMYdf38vLTIA==
Date: Thu, 6 Jun 2024 10:46:49 -0700
From: Kees Cook <kees@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, andy@kernel.org,
	akpm@linux-foundation.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	linux-tegra@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] mm/util: Swap kmemdup_array() arguments
Message-ID: <202406061046.A2137C9@keescook>
References: <20240606144608.97817-2-jean-philippe@linaro.org>
 <171768935175.54606.14878127902164737048.b4-ty@kernel.org>
 <CAHp75Vc-ALE=VDJs9062y-z5JW9_=z9axx2DL6B5ZeWD7zo-qQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vc-ALE=VDJs9062y-z5JW9_=z9axx2DL6B5ZeWD7zo-qQ@mail.gmail.com>

On Thu, Jun 06, 2024 at 08:35:13PM +0300, Andy Shevchenko wrote:
> On Thu, Jun 6, 2024 at 6:56 PM Kees Cook <kees@kernel.org> wrote:
> > On Thu, 06 Jun 2024 15:46:09 +0100, Jean-Philippe Brucker wrote:
> 
> [...]
> 
> > Applied to for-next/hardening, thanks!
> 
> Btw, is it possible to get this for v6.10, so we may start enabling it
> for others?

Which others do you mean?

-- 
Kees Cook
