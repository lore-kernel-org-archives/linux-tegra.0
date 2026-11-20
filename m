Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178433;
	b=1PFke63LJxeFz6es0WZKU/cSlJjMl+LAT9najHAdffJBzvJp11KXT897I3DkSKVamvK3
	 22jdE89yQUsOmF/TVxkXRIrh4F2lIH47JykAzPA14EgERDOEzD9/KCrJE3JJ6RTmCiwbq
	 LLRjJv/vybCaDR5FaaNL8nUBq6nhs7b5lj7bhPcGPOYsOcu2gj1naG+0Y9+GgRfh/avQE
	 7i5UWaekEU6xXMBMg0bVwbzYRKO1cTfBcCVw1GflWOXjdxK3cNaMPe1cfX5jSEKQBUrFE
	 kcWEe/JDypsT7yKS2OHCqA757CSBKCx+AEYlG3BMy1d1vJrDOk7RFiP04PjZogd7zkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178433;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/WObZ6l7ZTo8y3uK6MPgtaJjynqlTcrjs1y2uwelV70=;
	b=i3QAWbL4++6c6ifjgaYWgTVPw7QDYa3MCqF4gMlWKxC4B48zrI0IsvHSHXUOiJLbHX9R
	 CUgwuYLa5XBpEZvn0QT34RYFNSSwGBD4inZDnRY4lLMjPXMMSDvYkHgD4tNwPaStra/90
	 ZqyaVKyn2U4Fi7Q2uHKPjq2jhn90j4D8f+Ms0LuMqMoISEJdZEXUIAEMBCrf/5smXoqwt
	 VpHMShlETIznrlwLS6xjOMp6GNwDljxAiQePcZyYv497CJzSZ1xMHKlQJJFc7hMrXUwpr
	 DnusdeNd45bpkAuqQQB9Z+f1HSBvXc7e/UnvnAcqQQ33JCbUFcquH97v0geRdD/C3gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qtF5AdJo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98D7606A320;
	Fri, 20 Nov 2026 12:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qtF5AdJo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36191F000C4;
	Fri, 20 Nov 2026 12:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795178432;
	bh=/WObZ6l7ZTo8y3uK6MPgtaJjynqlTcrjs1y2uwelV70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=qtF5AdJoR9V2ZvQPriAdoaahpLj+w0i81lcdo5DUm9sqfbPpmxQSKEhfRIR3Ze39W
	 ZqgatxptsICeyRch9+Vbjve0Q1tbq08XA/2OOb3WjnQOYTF1TXNtT88G4cUfNqKCXC
	 zxi5jSXfAA7rC6BITrlX15Np8rJr157RS/CKCUM0=
Date: Fri, 20 Nov 2026 13:40:29 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-usb@vger.kernel.org, Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: phy: tegra: embed UTMI pad config in phy struct
Message-ID: <2026112019-remote-retrieval-69b8@gregkh>
References: <20260921015952.1047410-1-rosenp@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921015952.1047410-1-rosenp@gmail.com>

On Sun, Sep 20, 2026 at 06:59:52PM -0700, Rosen Penev wrote:
> The UTMI pad configuration was kept in a heap-allocated void * member of
> struct tegra_usb_phy, even though the driver is the only user of the
> field.  Embed the struct directly in the phy state to drop the
> allocation and the void pointer indirection.  The config is
> zero-initialized when the phy struct is allocated, so no extra init
> is needed.

But why is this needed?  What does this "fix"?
