Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0921347C6;
	Thu, 28 May 2026 21:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780003208; cv=none; b=RpOFD4J87705zobjwoXwPqrQXgumNMOVRx1ZAUGQBMwsLMgZFgtIYexaWZpgunmdPofY/Avi7WNrgU9je+8KUK+Ql1vVRrtKhRKxjBAl3w09XYv0P2u/Q0/xUGj/+8lBCKzDmVwVO6V4BfFvBwIXTIpgYMFqKiopr0xia4P25pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780003208; c=relaxed/simple;
	bh=pFqtNsgvK/nkVm4CVzK3/LaKEzTCBTy+zNCgzqeuN7k=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=bWuyScU0iZcD3RDSuJvi7ScQH+3wrIfWXSQtzNBEd2iN2kdgZKRGfzV8ck+zDAxkF9i7/Zb9HIX8+YUKgQ0r3MeK97hmHH74uJX9Zaprwnut97jin2lkS+MCsdhpc5gDRB4bNVXeBxR9Ot1ENh7vIlV9Kt/PIbr+ve9ZOuIf91Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oc2kCTQE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oc2kCTQE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A6A1F000E9;
	Thu, 28 May 2026 21:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780003207;
	bh=YzW1U44f4RW3heByRCcUya0EEGcxOJ3erFqxQWadsuQ=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=Oc2kCTQESm74zGwZvvNrZz4xvjMMHqIYCcJEWdyLetGkA5Diw96uC0kHVrw3UWc/Y
	 Wl60mfx8OZxHsPJcN0+0258h5uroQ97X7tq1JPGGkoGJftIq//nY11npVccpw0/NsQ
	 lxazzzSM5oNQrBfKWWiJ3xV6FS+T52lvAt2A73JG6qIfH9G1FMuq0jkesQutp/oLim
	 VWpvZsw4ER14oLLPJVhVPc1wNmgJMZ6nJxJKiZLDCKVEAfDUdWkV6FusrK3BgLm9FL
	 shF791AQI9YqWP2wDWPLgK/7716dSIBzOGRmuLhkGr+u5PDyd5DqXHMfU9jtGrUfE1
	 QiCONx/WbO6NQ==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 May 2026 23:19:59 +0200
Message-Id: <DIUMH0XLMHCK.1V16LRBHYXG17@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 0/4] Enable sysfs module symlink for more built-in
 drivers
Cc: "James Clark" <james.clark@linaro.org>, "Alexander Shishkin"
 <alexander.shishkin@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
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
To: "Shashank Balaji" <shashank.mahadasyam@sony.com>, "Suzuki K Poulose"
 <suzuki.poulose@arm.com>
References: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
 <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
In-Reply-To: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>

On Mon May 18, 2026 at 12:19 PM CEST, Shashank Balaji wrote:

> Shashank Balaji (4):
>       soc/tegra: cbb: Move driver registration from pure_initcall to core=
_initcall
>       kernel: param: initialize module_kset in a pure_initcall
>       coresight: pass THIS_MODULE implicitly through a macro
>       driver core: platform: set mod_name in driver registration

I assume this goes through driver-core.

Suzuki, please let me know if that's fine with you for the coresight change=
.

Thanks,
Danilo
