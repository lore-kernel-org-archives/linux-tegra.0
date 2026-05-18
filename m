Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBBD3E8338;
	Mon, 18 May 2026 10:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100081; cv=none; b=l4x9D+MqOUTPLWzWpvUp7HJBFV3IQkXVED6YXbGo+j5uuCdi3bOgT9VqWfhlGqXVwAAke5PvydBkehZu6PXl/fRg29t+7pibdfFU7DK9QADet+hparGEgamS1xzie3uLUAnssQhXFKSVHKs+sQIFzgNMm7LAvYpYtW+OnVkg1og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100081; c=relaxed/simple;
	bh=YLOEOYqUNAQEFO1TexjQZE85HRrFgr8e3AuK7+W2Ze0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNF7wpePauV1kvnwiI7/oKQjegL19ohkjhNUgBOr08Iqgk7TUizpEMyo6bP9RtFMA71xbRwjh/F5UFpJi8nEhJZ7lT1tCnLAAC1ePbq8GPBuwmKRJBeLKRFTk0w+s/lrj56AyTqvD7vNMTZk3pv3XRib7jlpFeNdwY6OnmxKKHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=w3u6WSpT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="w3u6WSpT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B823CC2BD00;
	Mon, 18 May 2026 10:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1779100079;
	bh=YLOEOYqUNAQEFO1TexjQZE85HRrFgr8e3AuK7+W2Ze0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w3u6WSpTP7/fvpaD9J1vxQsgPtGOq9pwBQ4hOSpDu7mD3Epg+4S2oOfqHu5BAfz/F
	 npl9YyI8s4EW1teGk3jRiZFSgfO2GGQ4nLaa57Y3PCHfRU2dVIhzdc9ILBVf7bEvT6
	 dElLkIS98P0GYrTqMhex6X2E7csM9pIRdMkUv8ao=
Date: Mon, 18 May 2026 12:27:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rahul Bukte <rahul.bukte@sony.com>, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>, linux-modules@vger.kernel.org,
	linux-tegra@vger.kernel.org, Sumit Gupta <sumitg@nvidia.com>
Subject: Re: [PATCH v5 4/4] driver core: platform: set mod_name in driver
 registration
Message-ID: <2026051827-curler-disjoin-c83f@gregkh>
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
 <20260518-acpi_mod_name-v5-4-705ccc430885@sony.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-acpi_mod_name-v5-4-705ccc430885@sony.com>

On Mon, May 18, 2026 at 07:20:00PM +0900, Shashank Balaji wrote:
> Pass KBUILD_MODNAME through the driver registration macro so that
> the driver core can create the module symlink in sysfs for built-in
> drivers, and fixup all callers.
> 
> The Rust platform adapter is updated to pass the module name through to the new
> parameter.
> 
> Tested on qemu with:
> - x86 defconfig + CONFIG_RUST
> - arm64 defconfig + CONFIG_RUST + CONFIG_CORESIGHT stuff
> 
> Examples after this patch:
> 
>     /sys/bus/platform/drivers/...
>         coresight-itnoc/module		-> coresight_tnoc
>         coresight-static-tpdm/module	-> coresight_tpdm
>         coresight-catu-platform/module	-> coresight_catu
>         serial8250/module		-> 8250
>         acpi-ged/module			-> acpi
>         vmclock/module			-> ptp_vmclock
> 
> Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> ---
> This patch depends on patches 1, 2, 3
> ---
>  Documentation/driver-api/driver-model/platform.rst |  3 ++-
>  drivers/base/platform.c                            | 21 ++++++++++++++-------
>  drivers/hwtracing/coresight/coresight-core.c       |  5 +++--
>  include/linux/coresight.h                          |  5 +++--
>  include/linux/platform_device.h                    | 17 +++++++++--------
>  rust/kernel/platform.rs                            |  4 +++-
>  6 files changed, 34 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/driver-api/driver-model/platform.rst b/Documentation/driver-api/driver-model/platform.rst
> index cf5ff48d3115..9673470bded2 100644
> --- a/Documentation/driver-api/driver-model/platform.rst
> +++ b/Documentation/driver-api/driver-model/platform.rst
> @@ -70,7 +70,8 @@ Kernel modules can be composed of several platform drivers. The platform core
>  provides helpers to register and unregister an array of drivers::
>  
>  	int __platform_register_drivers(struct platform_driver * const *drivers,
> -				      unsigned int count, struct module *owner);
> +				      unsigned int count, struct module *owner,
> +				      const char *mod_name);

Why can't you just use the owner->name value instead?  They are always
the same here, right?

thanks,

greg k-h
