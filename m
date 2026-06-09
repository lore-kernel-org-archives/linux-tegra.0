Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAE13F8244;
	Tue,  9 Jun 2026 10:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000952; cv=none; b=BQNCLGkzXyoxthS5fd/6M5P72aPgEyjw72QTwBXgvJ5ob0uLXkSi4mJTGCoeSb7UsIzE/9F+86lHTI7c9af8/KnQV1xDQqreBFsCVwXr3o3W5FweQCtjetk6eS7PWb81uL0LKg2M9629GD+WjCuCQwXVyryjH8SFJYEKBRLoA+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000952; c=relaxed/simple;
	bh=po2PVYBoQHn3TVJ3gPK9zEXZO2IncL6RJxbmazHAy8A=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=obgEcoWe5JLK72tBkl707jNtUQ/koN0cTFuwuqvE85J97EBa+AXKfOSQfDgzYdL6/x+rlV11APVD8rkd19lkfNfezBoP+F0lkIin9OjP3hn03pkJ5Eta630qDKh9fZkqbUeByeT4ObzrE2UO91OldPyvbDQb23G1yrSIBuoofQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ReKNvMcD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ReKNvMcD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD1D1F00893;
	Tue,  9 Jun 2026 10:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781000950;
	bh=Tta0PE+TZa8mL2th0Lo4FOkqR6QU33gR5Ohh0rNcY3c=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=ReKNvMcDkiw28GD3JbvCn9EipMm3IlPfdSUWfJXpK9M22Lgm/K3GFU1SXdrhkXZEB
	 5SdM69gC2r+NC3WYCbCyPuR0cxz1XkIOUgt6duIDMczoeCJR/yUOxNMDc0ndy4j1bL
	 fhLRu560UpjLJ6CgASjX+dnsScqp81YH+hH9fCPxrUrbK58RdWMsNFEr7vDg5pBwVs
	 35L1XnVoIyEwFAMW+axHlLAzHFwSMNxKWj5/H++TRdC8TACW8rcVaZM5dRKOPOwprT
	 tAGhAihwORzRGf1hQKmxKcgbu/f1FfpH3ai4lC8Wc3KCMX/XVXkAO378gK1Np1FfBm
	 cwCv4PY4W2rgg==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 12:29:02 +0200
Message-Id: <DJ4G55S28THG.21SSZK5PQQVGL@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 0/4] Enable sysfs module symlink for more built-in
 drivers
Cc: "Shashank Balaji" <shashank.mahadasyam@sony.com>, "James Clark"
 <james.clark@linaro.org>, "Alexander Shishkin"
 <alexander.shishkin@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Petr Pavlu" <petr.pavlu@suse.com>, "Daniel Gomez"
 <da.gomez@kernel.org>, "Sami Tolvanen" <samitolvanen@google.com>, "Aaron
 Tomlin" <atomlin@atomlin.com>, "Mike Leach" <mike.leach@arm.com>, "Leo Yan"
 <leo.yan@arm.com>, "Thierry Reding" <thierry.reding@kernel.org>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, "Rahul Bukte" <rahul.bukte@sony.com>,
 <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
 <linux-arm-kernel@lists.infradead.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Daniel
 Palmer" <daniel.palmer@sony.com>, "Tim Bird" <tim.bird@sony.com>,
 <linux-modules@vger.kernel.org>, <linux-tegra@vger.kernel.org>, "Sumit
 Gupta" <sumitg@nvidia.com>
To: "Suzuki K Poulose" <suzuki.poulose@arm.com>
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
 <20260608222448.1353773-1-dakr@kernel.org>
 <1c8e441a-6b33-465a-88f9-9552f346ae18@arm.com>
In-Reply-To: <1c8e441a-6b33-465a-88f9-9552f346ae18@arm.com>

On Tue Jun 9, 2026 at 11:08 AM CEST, Suzuki K Poulose wrote:
> On 08/06/2026 23:24, Danilo Krummrich wrote:
>> On Mon, 18 May 2026 19:19:56 +0900, Shashank Balaji wrote:
>>> [PATCH v5 0/4] Enable sysfs module symlink for more built-in drivers
>>=20
>> Applied, thanks!
>>=20
>>    Branch: driver-core-testing
>>    Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/dri=
ver-core.git
>>=20
>> [1/4] soc/tegra: cbb: Move driver registration from pure_initcall to cor=
e_initcall
>>        commit: cd6e95e7ab29
>> [2/4] kernel: param: initialize module_kset in a pure_initcall
>>        commit: c82dfce47833
>> [3/4] coresight: pass THIS_MODULE implicitly through a macro
>>        commit: efc22b3f89a3
>> [4/4] driver core: platform: set mod_name in driver registration
>>        commit: a7a7dc5c46a0
>>=20
>> The patches will appear in the next linux-next integration (typically wi=
thin 24
>> hours on weekdays).
>>=20
>> The patches are in the driver-core-testing branch and will be promoted t=
o
>> driver-core-next after validation.
>
> Apologies, I missed your emails. I am fine with those, happy to fixup=20
> anything if the linux-next screams.

Thanks for confirming! I did a test merge with linux-next and an allmodconf=
ig
arm64 build before picking it up, so it should be fine.

Thanks,
Danilo
