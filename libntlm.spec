
Name: libntlm
Version: 0.3.7
Release: 1
Group: Development/Libraries
Summary: Microsoft WinNT domain authentication library
License: GPL
Source: http://josefsson.org/libntlm/releases/libntlm-%{version}.tar.gz
URL: http://josefsson.org/libntlm/
BuildRoot: %{_tmppath}/root-%{name}-%{version}

%package devel
Group: Development/Libraries
Summary: Microsoft WinNT domain authentication library for development

%description
A library for authenticating with Microsoft NTLM challenge-response, 
derived from Samba sources.

%description devel
Development files needed for compiling against libntlm.

%prep
%setup

%build
%configure
make

%install
%makeinstall

%files
%defattr(-,-,root)
%{_libdir}/libntlm.so*

%files devel
%{_includedir}/ntlm.h
%{_libdir}/libntlm.a
%{_libdir}/libntlm.la
%{_libdir}/pkgconfig/libntlm.pc
