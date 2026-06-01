Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33153DA7C0;
	Mon,  1 Jun 2026 15:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780328937; cv=none; b=THml56Zg+yMfLAe67X5QxyEyRsvj7bQCk73Kcdn6ICUc4FQd1x+k/oZrAgpzOwiGljZeS+z8nagjVcSUEzTUC4Bbno80N218/zHAqnKOCF2oj4vu2jQgfKNkw+BwtDyT/G3tT9wazgYoiebQ7suFuXeiTmEIcdZxwMyGCUt7ypw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780328937; c=relaxed/simple;
	bh=eLYLsBb0ONwXHUDdcmFlUMyOyjoSEmiNVpHJ/FyPVxM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Jxrw84gVn1EPbr+9e2/F283I8mNGRKNd00m+lOYBBrhhiYlKl6/HfLp7wKB7y9ea3oRg2Zi8GGhjPDY7gLJnn9DzgSg/rzsEGpxE0j608etloOx4uyS6Zk2mJpoMfq1SW5bt/ix+yrs/V658uQ7/gf+bripIqNDY6kg6aBjAUPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NECP3/zX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NECP3/zX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38CA1F00893;
	Mon,  1 Jun 2026 15:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780328936;
	bh=eLYLsBb0ONwXHUDdcmFlUMyOyjoSEmiNVpHJ/FyPVxM=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=NECP3/zXoYK3LReSlsYz4ooKpK2nD/slHDnOEauFsl1dp0cnGLUjr2KviU0/1iYcf
	 4mYZ4YhVkFcwOd+mXk4T0azDsLoyFTQAI9sjMQ8/ItH+NXHoi4x/Oc5QmmFbVKkuf3
	 0Suh6cOnN9uHkDKOQpqYoMnwBifVyM4RrNKGg/pNPJvSskssbjES0SQg5W4pP2Kibr
	 +9sjXhTSnU3zfmZnqm2UyD1lYNdmu9vKaFNcvhVcYy2FiEcB+a6zm/deWOmB+iX19M
	 GiFjDdiigMlZ5B0aifU0iZx0lx5JiESjDADJqZ2Hi66N9IndK/10/38kij7W83cN1R
	 +otxfT1jkffXA==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 17:48:48 +0200
Message-Id: <DIXTXMSCSRPD.DKCTO34P6APU@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Petr Pavlu" <petr.pavlu@suse.com>,
 "Rahul Bukte" <rahul.bukte@sony.com>, <linux-kernel@vger.kernel.org>,
 <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, "Daniel Palmer" <daniel.palmer@sony.com>, "Tim
 Bird" <tim.bird@sony.com>, <linux-modules@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>, "Sumit Gupta" <sumitg@nvidia.com>, "James
 Clark" <james.clark@linaro.org>, "Alexander Shishkin"
 <alexander.shishkin@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, "Daniel Gomez" <da.gomez@kernel.org>,
 "Sami Tolvanen" <samitolvanen@google.com>, "Aaron Tomlin"
 <atomlin@atomlin.com>, "Mike Leach" <mike.leach@arm.com>, "Leo Yan"
 <leo.yan@arm.com>, "Thierry Reding" <thierry.reding@kernel.org>, "Jonathan
 Hunter" <jonathanh@nvidia.com>
To: "Shashank Balaji" <shashank.mahadasyam@sony.com>, "Suzuki K Poulose"
 <suzuki.poulose@arm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v6] kernel: param: initialize module_kset in a
 pure_initcall
References: <ahEd4iC-2hqUbMy3@JPC00244420>
 <20260601101942.4002661-1-shashank.mahadasyam@sony.com>
In-Reply-To: <20260601101942.4002661-1-shashank.mahadasyam@sony.com>

On Mon Jun 1, 2026 at 12:19 PM CEST, Shashank Balaji wrote:
> Danilo, I'm assuming this series goes through driver-core. Could you plea=
se
> pick up this version of this patch and the v5 of the others?

Yes, that's fine. It would be nice to have an ACK from Suzuki for the cores=
ight
changes though.

Suzuki, is this fine with you?

Also, for the future, please don't send new versions as a reply to previous
versions, bus as a new thread.

Thanks,
Danilo
